from django.conf.urls import patterns, include, url
from api import views
urlpatterns = patterns('',
    url(r'^$', views.home, name='home'),
    url(r'^cms/', include('api.cms_urls')),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^forgot_password/$', views.forgot_password, name='forgot_password'),
    url(r'^reset_password/$', views.reset_password, name='reset_password'),
    url(r'^change_password/$', views.change_password, name='change_password'),
    url(r'^get_profile/$', views.get_profile, name='get_profile'),
    url(r'^edit_profile/$', views.edit_profile, name='edit_profile'),
    
)
