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
                       # url(r'^add-to-menu/$', add_to_menu, name='add_to_menu'),
                       url(r'^menu/$', menu, name='menu'),
                       url(r'^recipe/(?P<id>\d+)/can_make/$', can_make_recipe, name='can_make_recipe'),
                       url(r'^recipe/(?P<id>\d+)/rate/$', rate_recipe, name='rate_recipe'),
                       url(r'^remove-from-fridge/(?P<id>\d+)/$', remove_from_fridge, name='remove_from_fridge'),
                       url(r'^remove-from-menu/(?P<id>\d+)/$', remove_from_menu, name='remove_from_menu'),
                       url(r'^add-to-menu/$', add_to_menu, name='add_to_menu'),
)