from django.conf.urls import patterns, include, url
from api.views import cms
urlpatterns = patterns('',
    url(r'^$', cms.home, name='cms_home'),
    
)
