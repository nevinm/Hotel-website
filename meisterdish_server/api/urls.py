'''
API url patters: /api/
'''
from django.conf.urls import patterns, url

from api.views.cart import add_to_cart, update_cart, remove_from_cart,\
    delete_cart, get_cart_items, get_cart_items_count, save_delivery_time,\
    check_delivery
from api.views.common import home, signup, login, logout, forgot_password,\
    reset_password, change_password, get_profile, edit_profile, change_email,\
    get_address_list, get_cities, upload_picture, validate_session,\
    send_contactus_email, unsubscribe_from_emails, get_home_meal,\
    get_states
from api.views.meals import get_meals, get_meal_details
from api.views.order import get_orders, get_order_details, create_order,\
    get_delivery_slots
from api.views.promotions import apply_promocode, gift_card_order,\
    remove_promocode
from api.views.user import add_address, remove_address, update_address,\
    get_categories, add_rating, get_user_reviews, get_saved_cards,\
    save_credit_card, delete_credit_card, update_credit_card, share_via_email,\
    save_email


urlpatterns = patterns(
    '',
    url(r'^$', home, name='home'),
    url(r'^signup/$', signup, name='signup'),
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, name='logout'),
    url(r'^forgot_password/$', forgot_password, name='forgot_password'),
    url(r'^reset_password/$', reset_password, name='reset_password'),
    url(r'^change_password/$', change_password, name='change_password'),
    url(r'^get_profile/$', get_profile, name='get_profile'),
    url(r'^edit_profile/$', edit_profile, name='edit_profile'),
    url(r'^change_email/$', change_email, name='change_email'),

    url(r'^add_address/$', add_address, name='add_address'),
    url(r'^remove_address/$', remove_address, name='remove_address'),
    url(r'^update_address/(?P<address_id>[0-9]+)/$', update_address,
        name='update_address'),
    url(r'^get_address_list/$', get_address_list,
        name='get_address_list'),

    url(r'^get_meals/$', get_meals, name='get_meals'),
    url(r'^get_meal_details/(?P<meal_id>[0-9]+)/$', get_meal_details,
        name='get_meal_details'),

    url(r'^get_states/$', get_states, name='get_states'),
    url(r'^get_cities/$', get_cities, name='get_cities'),

    url(r'^upload_picture/$', upload_picture, name='upload_picture'),

    url(r'^get_categories/$', get_categories, name='get_categories'),

    url(r'^add_to_cart/$', add_to_cart, name='add_to_cart'),
    url(r'^update_cart/$', update_cart, name='update_cart'),
    url(r'^remove_from_cart/$', remove_from_cart,
        name='remove_from_cart'),
    url(r'^delete_cart/$', delete_cart, name='delete_cart'),
    url(r'^get_cart_items/$', get_cart_items, name='get_cart_items'),
    url(r'^get_cart_items_count/$', get_cart_items_count,
        name='get_cart_items_count'),

    url(r'^add_rating/(?P<meal_id>[0-9]+)/$', add_rating,
        name='add_rating'),
    url(r'^get_user_reviews/$', get_user_reviews,
        name='get_user_reviews'),

    url(r'^get_orders/$', get_orders, name='get_orders'),
    url(r'^get_order_details/(?P<order_id>[0-9]+)/$', get_order_details,
        name='get_order_details'),
    url(r'^create_order/$', create_order, name='create_order'),
    url(r'^save_delivery_time/$', save_delivery_time,
        name='save_delivery_time'),
    url(r'^get_delivery_slots/$', get_delivery_slots,
        name='get_delivery_slots'),

    url(r'^get_saved_cards/$', get_saved_cards, name='get_saved_cards'),
    url(r'^save_credit_card/$', save_credit_card,
        name='save_credit_card'),
    url(r'^delete_credit_card/(?P<card_id>[0-9]+)/$', delete_credit_card,
        name='delete_credit_card'),
    url(r'^update_credit_card/(?P<card_id>[0-9]+)/$', update_credit_card,
        name='update_credit_card'),

    url(r'^check_delivery/$', check_delivery, name='check_delivery'),
    url(r'^apply_promocode/$', apply_promocode,
        name='apply_promocode'),
    url(r'^gift_card_order/$', gift_card_order,
        name='gift_card_order'),
    url(r'^remove_promocode/$', remove_promocode,
        name='remove_promocode'),

    url(r'^share_email/$', share_via_email, name='share_via_email'),
    url(r'^validate_session/$', validate_session,
        name='validate_session'),

    url(r'^save_email/$', save_email, name='save_email'),
    url(r'^send_contactus_email/$', send_contactus_email,
        name='send_contactus_email'),
    url(r'^unsubscribe_from_emails/$', unsubscribe_from_emails,
        name='unsubscribe_from_emails'),

    url(r'get_home_meal/$', get_home_meal, name="get_home_meal"),

)
