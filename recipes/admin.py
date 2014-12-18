from django.contrib import admin
from recipes.models import Recipe, Product, Measurement

admin.site.register(Recipe)
admin.site.register(Product)
admin.site.register(Measurement)
