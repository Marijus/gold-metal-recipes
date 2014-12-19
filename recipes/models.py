from django.db import models
from sorl.thumbnail import ImageField
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
from django.db import IntegrityError
from django.db.models.signals import post_save
from django.dispatch import receiver


class Measurement(models.Model):
    title = models.CharField(max_length=250)
    short_title = models.CharField(max_length=10)

    def __unicode__(self):
        return self.title + " (" + self.short_title + ")"


class Product(models.Model):
    title = models.CharField(max_length=250)
    description = models.TextField(blank=True, null=True)
    photo = ImageField(upload_to="products", blank=True, null=True)

    def __unicode__(self):
        return self.title


class ProductMeasurement(models.Model):
    product = models.ForeignKey(Product)
    measurement = models.ForeignKey(Measurement)
    value = models.FloatField()

    def __unicode__(self):
        return self.product.title + " " + self.measurement.title + " " + str(self.value)


class Ingridient(models.Model):
    product = models.ForeignKey(Product)
    measurement = models.ForeignKey(Measurement)
    value = models.FloatField()
    recipe = models.ForeignKey('Recipe')

    def __unicode__(self):
        return self.product.title + " " + self.measurement.title + " " + str(self.value)


class Fridge(models.Model):
    user = models.ForeignKey(User)
    products = models.ManyToManyField(ProductMeasurement)

    def __unicode__(self):
        return self.user.username + "' fridge"


class Recipe(models.Model):
    """
        Recipe class that represents recipe model.
    """
    user = models.ForeignKey(User, null=True, blank=True)
    title = models.CharField(max_length=250)
    slug = models.SlugField(unique=True, editable=False)
    date = models.DateTimeField(auto_now=True, blank=True, null=True)
    description = models.TextField()
    photo1 = ImageField(upload_to="images")
    photo2 = ImageField(upload_to="images", blank=True, null=True)
    photo3 = ImageField(upload_to="images", blank=True, null=True)
    overall_rating = models.IntegerField(default=0)

    def __unicode__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)

        try:
            super(Recipe, self).save(*args, **kwargs)
        except IntegrityError:
            self.slug += "-" + str(self.id)
        finally:
            super(Recipe, self).save(*args, **kwargs)

    def match_with_fridge(self, fridge, portions=1):
        matches = list()
        ingridients = Ingridient.objects.filter(recipe=self)
        for ingridient in ingridients:
            match = dict()
            match["ingridient"] = ingridient
            match["ingridient_value"] = ingridient.value * portions
            match["in_fridge"] = False

            if fridge is not None:
                for item in fridge.products.all():
                    if item.product == ingridient.product:
                        match["in_fridge"] = True
                        match["missing"] = False
                        match["item_in_fridge"] = item

                        # Find missing amount
                        if item.measurement == ingridient.measurement:
                            if item.value < ingridient.value * portions:
                                match["missing"] = True
                                match["missing_value"] = ingridient.value - item.value
                        else:
                            match["measurements_mismatch"] = True
                            match["missing"] = True

            matches.append(match)

        return matches

    def can_make_from_fridge(self, fridge, portions=1):
        matches = self.match_with_fridge(fridge, portions)

        for match in matches:
            if not match["in_fridge"] or match["missing"]:
                return False

        return True

    def get_overall_rating(self):
        ratings = [rating.rating for rating in Rating.objects.filter(recipe=self)]

        if len(ratings) > 0:
            return int(sum(ratings) / float(len(ratings)))

        return 0


class Rating(models.Model):
    user = models.ForeignKey(User)
    recipe = models.ForeignKey(Recipe)
    rating = models.FloatField()

    def __unicode__(self):
        return self.user.username + " rating on " + self.recipe.title

    def save(self, *args, **kwargs):
        super(Rating, self).save(*args, **kwargs)
        self.recipe.overall_rating = self.recipe.get_overall_rating()
        self.recipe.save()


class Menu(models.Model):
    user = models.ForeignKey(User)

    def __unicode__(self):
        return self.user.username + " menu"

    def get_missing_ingridients(self, fridge):
        menu_items = [recipe.recipe.match_with_fridge(fridge, recipe.portions) for recipe in
                      MenuItem.objects.filter(menu=self)]

        missing_ingridients = list()

        for menu_item in menu_items:
            for item in menu_item:
                # create new item in shopping list
                new_item_created = True
                missing_ingridient = {"missing_value": 0}

                # check if the same item is already in the shopping list
                for ingridient in missing_ingridients:
                    if ingridient["product"] == item["ingridient"].product and ingridient["measurement"] == item[
                        "ingridient"].measurement:
                        missing_ingridient = ingridient
                        new_item_created = False
                        break

                # if item is not in the fridge or it is in the fridge but some amount is missing
                if not item["in_fridge"] or item["missing"]:
                    missing_ingridient["product"] = item["ingridient"].product
                    missing_ingridient["measurement"] = item["ingridient"].measurement

                    if "missing_value" in item:
                        missing_ingridient["missing_value"] += item["missing_value"]
                    else:
                        missing_ingridient["missing_value"] += item["ingridient_value"]

                    if new_item_created:
                        missing_ingridients.append(missing_ingridient)

        return missing_ingridients


class MenuItem(models.Model):
    recipe = models.ForeignKey(Recipe)
    menu = models.ForeignKey(Menu)
    date = models.DateField()
    portions = models.IntegerField(default=1)

    def __unicode__(self):
        return self.recipe.title + " in" + self.menu.user.username + "' menu"

    def match_with_fridge(self, fridge, portions):
        return self.recipe.match_with_fridge(fridge, portions)


@receiver(post_save, sender=User)
def user_pre_save(sender, instance, *args, **kwargs):
    if not Menu.objects.filter(user=instance).exists():
        menu = Menu()
        menu.user = instance
        menu.save()
    if not Fridge.objects.filter(user=instance).exists():
        fridge = Fridge()
        fridge.user = instance
        fridge.save()