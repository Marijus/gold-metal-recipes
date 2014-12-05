from django.conf.urls import patterns, include, url
from django.contrib import admin

from recipes.views import *

urlpatterns = patterns('',
                       url(r'^$', index, name='index'),
)
