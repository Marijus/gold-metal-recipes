from django.db import models
from sorl.thumbnail import ImageField
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
from django.db import IntegrityError


class Category(models.Model):
    title = models.CharField(max_length=250)

    def __unicode__(self):
        return self.title


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
    category = models.ForeignKey(Category)
    title = models.CharField(max_length=250)
    slug = models.SlugField(unique=True, editable=False)
    description = models.TextField()
    photo1 = ImageField(upload_to="images")
    photo2 = ImageField(upload_to="images", blank=True, null=True)
    photo3 = ImageField(upload_to="images", blank=True, null=True)

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