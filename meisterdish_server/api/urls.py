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
    
    url(r'^add_address/$', views.add_address, name='add_address'),
    url(r'^remove_address/$', views.remove_address, name='remove_address'),
    url(r'^update_address/(?P<address_id>[0-9]+)/$', views.update_address, name='update_address'),
    
    url(r'^get_states/$', views.get_states, name='get_states'),
    url(r'^get_cities/$', views.get_cities, name='get_cities'),
    
)
