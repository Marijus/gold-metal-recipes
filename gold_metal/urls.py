from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'gold_metal.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^', include('recipes.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/', include('allauth.urls')),
)
