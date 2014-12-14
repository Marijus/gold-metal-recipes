from django.conf.urls import patterns, include, url
from django.contrib import admin

from recipes.views import *

urlpatterns = patterns('',
                       url(r'^$', index, name='index'),
                       url(r'^add-recipe/$', add_recipe, name='add_recipe'),
                       url(r'^add-measurement/$', add_measurement, name='add_measurement'),
                       url(r'^add-product/$', add_product, name='add_product'),
                       url(r'^products/$', products, name='products'),
                       url(r'^measurements/$', measurements, name='measurements'),
                       url(r'^add-to-fridge/$', add_to_fridge, name='add_to_fridge'),
                       url(r'^fridge/$', fridge, name='fridge'),
                       url(r'^recipe/(?P<slug>[-_\w]+)/$', recipe, name='recipe'),
                       url(r'^recipes/$', recipes, name='recipes'),
                       url(r'^add-to-menu/$', add_to_menu, name='add_to_menu'),
                       url(r'^menu/$', menu, name='menu'),
)
