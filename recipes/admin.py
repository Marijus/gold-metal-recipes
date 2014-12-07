from django.contrib import admin
from recipes.models import Category, Recipe, Product, Measurement

admin.site.register(Category)
admin.site.register(Recipe)
admin.site.register(Product)
admin.site.register(Measurement)
