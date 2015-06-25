from django.conf.urls import patterns, include, url
from api import views
from api.views import promotions, meals
urlpatterns = patterns('',
    url(r'^$', views.home, name='home'),
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

    url(r'^get_meals/$', meals.get_meals, name='get_meals'),
    url(r'^get_meal_details/(?P<meal_id>[0-9]+)/$', meals.get_meal_details, name='get_meal_details'),

    url(r'^get_states/$', views.get_states, name='get_states'),
    url(r'^get_cities/$', views.get_cities, name='get_cities'),
 
    url(r'^upload_picture/$', views.upload_picture, name='upload_picture'),
    
    url(r'^get_categories/$', views.get_categories, name='get_categories'),

    url(r'^add_to_cart/$', views.add_to_cart, name='add_to_cart'),
    url(r'^update_cart/$', views.update_cart, name='update_cart'),
    url(r'^remove_from_cart/$', views.remove_from_cart, name='remove_from_cart'),
    url(r'^delete_cart/$', views.delete_cart, name='delete_cart'),
    url(r'^get_cart_items/$', views.get_cart_items, name='get_cart_items'),
    url(r'^get_cart_items_count/$', views.get_cart_items_count, name='get_cart_items_count'),
    
    url(r'^add_rating/(?P<meal_id>[0-9]+)/$', views.add_rating, name='add_rating'),
    url(r'^get_user_reviews/$', views.get_user_reviews, name='get_user_reviews'),
    
    url(r'^get_orders/$', views.get_orders, name='get_orders'),
    url(r'^get_order_details/(?P<order_id>[0-9]+)/$', views.get_order_details, name='get_order_details'),
    url(r'^create_order/$', views.create_order, name='create_order'),
    url(r'^save_delivery_time/$', views.save_delivery_time, name='save_delivery_time'),
    

    url(r'^get_saved_cards/$', views.get_saved_cards, name='get_saved_cards'),
    url(r'^save_credit_card/$', views.save_credit_card, name='save_credit_card'),
    url(r'^delete_credit_card/(?P<card_id>[0-9]+)/$', views.delete_credit_card, name='delete_credit_card'),
    url(r'^update_credit_card/(?P<card_id>[0-9]+)/$', views.update_credit_card, name='update_credit_card'),

    #url(r'^paypal_success/$', views.paypal_success, name='paypal_success'),
    #url(r'^paypal_ipn/$', views.paypal_ipn, name='paypal_ipn'),

    url(r'^check_delivery/$', views.check_delivery, name='check_delivery'),
    url(r'^apply_promocode/$', promotions.apply_promocode, name='apply_promocode'),
    url(r'^gift_card_order/$', promotions.gift_card_order, name='gift_card_order'),
    
    url(r'^share_email/$', views.share_via_email, name='share_via_email'),
    url(r'^validate_session/$', views.validate_session, name='validate_session'),
)
