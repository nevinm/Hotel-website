from django.conf.urls import patterns, include, url
from api.views import cms
urlpatterns = patterns('',
    url(r'^$', cms.home, name='cms_home'),
    url(r'^get_categories/$', cms.get_categories, name='get_categories'),
    url(r'^add_category/$', cms.add_category, name='add_category'),
    url(r'^remove_category/$', cms.remove_category, name='remove_category'),
    url(r'^update_category/$', cms.update_category, name='update_category'),
    
    url(r'^delete_user/$', cms.delete_user, name='delete_user'),
    url(r'^update_user/$', cms.update_user, name='update_user'),
    url(r'^get_users/$', cms.get_users, name='get_users'),
    url(r'^change_user_status/$', cms.change_user_status, name='change_user_status'),
    
    url(r'^get_meals/$', cms.get_meals, name='get_meals'),
    url(r'^create_meal/$', cms.create_meal, name='create_meal'),
    url(r'^delete_meal/(?P<meal_id>[0-9]+)/$', cms.delete_meal, name='delete_meal'),
)
