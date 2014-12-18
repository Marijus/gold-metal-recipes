from django.contrib import admin
from recipes.models import Recipe, Product, Measurement, Menu, Fridge

class FridgeAdmin(admin.ModelAdmin):
    filter_horizontal = ('products',)


# class MenuAdmin(admin.ModelAdmin):
#     filter_horizontal = ('recipes',)

admin.site.register(Recipe)
admin.site.register(Product)
admin.site.register(Measurement)
admin.site.register(Fridge, FridgeAdmin)
# admin.site.register(Menu, MenuAdmin)
