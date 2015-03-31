from django.conf.urls import patterns, include, url
from api.views import cms
urlpatterns = patterns('',
    url(r'^$', cms.home, name='cms_home'),
    url(r'^login/$', cms.login, name='cms_login'),
    url(r'^logout/$', cms.logout, name='cms_logout'),
    url(r'^forgot_password/$', cms.forgot_password, name='cms_forgot_password'),
    url(r'^reset_password/$', cms.reset_password, name='cms_reset_password'),
    url(r'^change_password/$', cms.change_password, name='cms_change_password'),
    url(r'^get_profile/$', cms.get_profile, name='cms_get_profile'),
    url(r'^edit_profile/$', cms.edit_profile, name='cms_edit_profile'),
    
)
