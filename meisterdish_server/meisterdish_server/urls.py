from django.conf.urls import patterns, include, url
from django.contrib import admin
from api.views.common import verify_user, verify_email, referral_return,\
    unsubscribe_from_emails
from api.views.order import print_pdf


urlpatterns = patterns(
    '',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/cms/', include('cms.urls')),
    url(r'^api/', include('api.urls')),
    url(r'^verify-user/(?P<token>[A-Za-z\d]+)/$',
        verify_user, name='verify_user'),
    url(r'^verify-email/(?P<token>[A-Za-z\d]+)/$',
        verify_email, name='verify_email'),
    url(r'^share/(?P<token>[_A-Za-z\d]+)/$',
        referral_return, name='referral_return'),
    url(r'^unsubscribe_from_emails/(?P<token>[=_A-Za-z\d]+)/$',
        unsubscribe_from_emails, name='unsubscribe_from_emails'),
    url(r'^print_pdf/', print_pdf, name="print_pdf"),
)
