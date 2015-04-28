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
    url(r'^change_email/$', views.change_email, name='change_email'),
    
    url(r'^add_address/$', views.add_address, name='add_address'),
    url(r'^remove_address/$', views.remove_address, name='remove_address'),
    url(r'^update_address/(?P<address_id>[0-9]+)/$', views.update_address, name='update_address'),
    url(r'^get_address_list/$', views.get_address_list, name='get_address_list'),

    url(r'^get_states/$', views.get_states, name='get_states'),
    url(r'^get_cities/$', views.get_cities, name='get_cities'),
 
    url(r'^redeem_gift_card/$', views.redeem_gift_card, name='redeem_gift_card'),
    url(r'^upload_picture/$', views.upload_picture, name='upload_picture'),
    
    url(r'^get_categories/$', views.get_categories, name='get_categories'),

    url(r'^add_to_cart/$', views.add_to_cart, name='add_to_cart'),
    url(r'^update_cart/$', views.update_cart, name='update_cart'),
    url(r'^remove_from_cart/$', views.remove_from_cart, name='remove_from_cart'),
    url(r'^delete_cart/$', views.delete_cart, name='delete_cart'),
    url(r'^get_cart_items/$', views.get_cart_items, name='get_cart_items'),
    url(r'^get_cart_items_count/$', views.get_cart_items_count, name='get_cart_items_count'),
    
    url(r'^add_rating/(?P<meal_id>[0-9]+)/$', views.add_rating, name='add_rating'),
    url(r'^get_meal_details/(?P<meal_id>[0-9]+)/$', views.get_meal_details, name='get_meal_details'),

    url(r'^upload_image/$', views.upload_image, name='upload_image'),
    
    url(r'^get_orders/$', views.get_orders, name='get_orders'),
    url(r'^get_order_details/(?P<order_id>[0-9]+)/$', views.get_order_details, name='get_order_details'),
    url(r'^create_order/$', views.create_order, name='create_order'),

    url(r'^list_credit_cards/$', views.list_credit_cards, name='list_credit_cards'),
    url(r'^save_credit_card/$', views.save_credit_card, name='save_credit_card'),
    url(r'^delete_credit_card/(?P<card_id>[0-9]+)/$', views.delete_credit_card, name='delete_credit_card'),
)
