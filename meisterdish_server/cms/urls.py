'''
URL patterns for cms admin: /api/cms/
'''
from django.conf.urls import patterns, include, url

from cms.views import general, order, promotions, meals, delivery
from cms.views.order import export_kitchen_orders


urlpatterns = patterns(
    '',
    url(r'^$', general.home, name='cms_home'),

    url(r'^login/$', general.login, name='login'),
    url(r'^logout/$', general.logout, name='logout'),

    url(r'^get_categories/$', general.get_categories,
        name='get_categories'),
    url(r'^get_categories_filters/$',
        general.get_categories_filters,
        name='get_categories_filters'),
    url(r'^add_category/$', general.add_category,
        name='add_category'),
    url(r'^remove_category/$', general.remove_category,
        name='remove_category'),
    url(r'^update_category/$', general.update_category,
        name='update_category'),

    url(r'^delete_user/$', general.delete_user,
        name='delete_user'),
    url(r'^update_user/$', general.update_user,
        name='update_user'),
    url(r'^get_users/$', general.get_users,
        name='get_users'),
    url(r'^change_user_status/$',
        general.change_user_status,
        name='change_user_status'),

    url(r'^set_ambassador/$',
        general.set_ambassador,
        name='set_ambassador'),
    url(r'^export_users/$', general.export_users,
        name='export_users'),
    url(r'^export_users_for_promotion/$',
        general.export_users_for_promotion,
        name='export_users_for_promotion'),

    url(r'^get_meals/$', meals.get_meals, name='get_meals'),
    url(r'^get_meal_details/(?P<meal_id>[0-9]+)/$',
        meals.get_meal_details, name='get_meal_details'),
    url(r'^create_meal/$', meals.create_meal,
        name='create_meal'),
    url(r'^delete_meal/(?P<meal_id>[0-9]+)/$',
        meals.delete_meal, name='delete_meal'),
    url(r'^update_meal_order/(?P<meal_id>[0-9]+)/$',
        meals.update_meal_order, name='update_meal_order'),
    url(r'^update_meal_availablity/(?P<meal_id>[0-9]+)/$',
        meals.update_meal_availablity,
        name='update_meal_availablity'),


    url(r'^delete_order/(?P<order_id>[0-9]+)/$',
        order.delete_order, name='delete_order'),
    url(r'^update_order/(?P<order_id>[0-9]+)/$',
        order.update_order, name='update_order'),

    url(r'^manage_gift_card/$', promotions.manage_gift_card,
        name='manage_gift_card'),
    url(r'^list_gift_cards/$', promotions.list_gift_cards,
        name='list_gift_cards'),

    url(r'^manage_promocode/$', promotions.manage_promocode,
        name='manage_promocode'),
    url(r'^list_promocodes/$', promotions.list_promocodes,
        name='list_promocodes'),
    url(r'^change_promocode_status/$',
        promotions.change_promocode_status,
        name='change_promocode_status'),

    url(r'^get_delivery_areas/$',
        delivery.get_delivery_areas,
        name='get_delivery_areas'),
    url(r'^manage_delivery_area/$',
        delivery.manage_delivery_area,
        name='manage_delivery_area'),
    url(r'^manage_delivery_slots/$',
        delivery.manage_delivery_slots,
        name='manage_delivery_slots'),
    url(r'^get_delivery_slots/$',
        delivery.get_delivery_slots,
        name='get_delivery_slots'),

    url(r'^upload_image/$', general.upload_image,
        name='upload_image'),
    url(r'^notification_settings/$',
        general.notification_settings,
        name='notification_settings'),

    url(r'^get_orders/$', order.get_orders,
        name='get_orders'),
    url(r'^get_order_details/(?P<order_id>[0-9]+)/$',
        order.get_order_details, name='get_order_details'),
    url(r'^export_orders/$', order.export_orders,
        name='export_orders'),

    url(r'^get_kitchen_orders/$', order.get_kitchen_orders,
        name='get_kitchen_orders'),
    url(r'^export_kitchen_orders',
        order.export_kitchen_orders, name='export_kitchen_orders'),
    url(r'^get_delivery_orders/$',
        order.get_delivery_orders,
        name='get_delivery_orders'),

    url(r'^import_meals/$', meals.import_meals,
        name='import_meals'),
    url(r'^manage_credits/$', promotions.manage_credits,
        name='manage_credits'),

    url(r'^create_attribute/$', meals.create_attribute,
        name='create_attribute'),
    url(r'^list_attributes/$', meals.list_attributes,
        name='list_attributes'),
    url(r'^delete_attribute/(?P<attribute_id>[0-9]+)/$',
        meals.delete_attribute, name='delete_attribute'),

    url(r'^export_zips_unsupported/$',
        general.export_zips_unsupported,
        name='export_zips_unsupported'),
    url(r'^update_home_meal/$', meals.update_home_meal,
        name='update_home_meal'),
    url(r'^get_home_meal/$', meals.get_home_meal,
        name='get_home_meal'),

    url(r'^add_ingredient/$', meals.add_ingredient,
        name='add_ingredient'),
    url(r'^list_ingredients/$', meals.list_ingredients,
        name='list_ingredients'),
    url(r'^update_ingredient/(?P<ing_id>[0-9]+)/$',
        meals.update_ingredient, name='update_ingredient'),
    url(r'^delete_ingredient/(?P<ing_id>[0-9]+)/$',
        meals.delete_ingredient, name='delete_ingredient'),

    url(r'^get_meal_ratings/(?P<meal_id>[0-9]+)/$',
        meals.get_meal_ratings, name='get_meal_ratings'),
    url(r'^delete_meal_rating/(?P<pk>[0-9]+)/$',
        meals.delete_meal_rating,
        name='delete_meal_rating'),
    url(r'^get_all_ratings/$',
        meals.get_all_ratings,
        name="get_all_ratings"),

    url(r'^update_meal_soldout/$',
        meals.update_meal_soldout,
        name="update_meal_soldout"),

)
