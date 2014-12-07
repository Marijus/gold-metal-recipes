from django.conf.urls import patterns, include, url
from django.contrib import admin

from recipes.views import *

urlpatterns = patterns('',
                       url(r'^$', index, name='index'),
                       url(r'^recipes/add', add_recipe, name='add_recipe'),
                       url(r'^add-measurement/$', add_measurement, name='add_measurement'),
)
