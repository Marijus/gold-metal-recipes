from django.db import models
from sorl.thumbnail import ImageField
from django.contrib.auth.models import User


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


class Fridge(models.Model):
    user = models.ForeignKey(User)
    products = models.ManyToManyField(ProductMeasurement)

    def __unicode__(self):
        return self.user.username + "' fridge"


class Recipe(models.Model):
    """
        Recipe class that represents recipe model.
    """
    VISABILITY = (
        ("1", "public"),
        ("0", 'private'),
    )

    category = models.ForeignKey(Category)
    products = models.ManyToManyField(ProductMeasurement)
    title = models.CharField(max_length=250)
    description = models.TextField()
    visability = models.CharField(max_length=1, choices=VISABILITY, default="1")
    photo1 = ImageField(upload_to="images")
    photo2 = ImageField(upload_to="images")
    photo3 = ImageField(upload_to="images")

    def __unicode__(self):
        return self.title