from django.conf.urls import patterns, include, url
from api.views import cms
urlpatterns = patterns('',
    url(r'^$', cms.home, name='cms_home'),
    url(r'^get_categories/$', cms.get_categories, name='get_categories'),
    url(r'^add_category/$', cms.add_category, name='add_category'),
    url(r'^remove_category/$', cms.remove_category, name='remove_category'),
)
