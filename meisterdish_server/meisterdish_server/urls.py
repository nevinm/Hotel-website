from django.conf.urls import patterns, include, url
from django.contrib import admin
from api import views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'meisterdish_server.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include('api.urls')),
    url(r'^verify_user/(?P<token>[A-Za-z\d]+)/$', views.verify_user, name='verify_user'),
    url(r'^verify_email/(?P<token>[A-Za-z\d]+)/$', views.verify_email, name='verify_email'),
)
