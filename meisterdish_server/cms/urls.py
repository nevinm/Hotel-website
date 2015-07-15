from django.conf.urls import patterns, include, url
from cms.views import general, order, promotions, meals, delivery

urlpatterns = patterns('',
    url(r'^$', general.home, name='cms_home'),

    url(r'^login/$', general.login, name='login'),
    url(r'^logout/$', general.logout, name='logout'),

    url(r'^get_categories/$', general.get_categories, name='get_categories'),
    url(r'^get_categories_filters/$', general.get_categories_filters, name='get_categories_filters'),
    url(r'^add_category/$', general.add_category, name='add_category'),
    url(r'^remove_category/$', general.remove_category, name='remove_category'),
    url(r'^update_category/$', general.update_category, name='update_category'),
    
    url(r'^delete_user/$', general.delete_user, name='delete_user'),
    url(r'^update_user/$', general.update_user, name='update_user'),
    url(r'^get_users/$', general.get_users, name='get_users'),
    url(r'^change_user_status/$', general.change_user_status, name='change_user_status'),
    url(r'^export_users/$', general.export_users, name='export_users'),
    url(r'^export_users_for_promotion/$', general.export_users_for_promotion, name='export_users_for_promotion'),
    
    url(r'^get_meals/$', meals.get_meals, name='get_meals'),
    url(r'^get_meal_details/(?P<meal_id>[0-9]+)/$', meals.get_meal_details, name='get_meal_details'),
    url(r'^create_meal/$', meals.create_meal, name='create_meal'),
    url(r'^delete_meal/(?P<meal_id>[0-9]+)/$', meals.delete_meal, name='delete_meal'),
    #url(r'^export_meals/$', meals.export_meals, name='export_meals'),
    url(r'^update_meal_order/(?P<meal_id>[0-9]+)/$', meals.update_meal_order, name='update_meal_order'),
    

    url(r'^delete_order/(?P<order_id>[0-9]+)/$', order.delete_order, name='delete_order'),
    url(r'^update_order/(?P<order_id>[0-9]+)/$', order.update_order, name='update_order'),

    url(r'^manage_gift_card/$', promotions.manage_gift_card, name='manage_gift_card'), 
    url(r'^list_gift_cards/$', promotions.list_gift_cards, name='list_gift_cards'), 
    
    url(r'^manage_promocode/$', promotions.manage_promocode, name='manage_promocode'), 
    url(r'^list_promocodes/$', promotions.list_promocodes, name='list_promocodes'), 
    url(r'^change_promocode_status/$', promotions.change_promocode_status, name='change_promocode_status'), 

    url(r'^get_delivery_areas/$', delivery.get_delivery_areas, name='get_delivery_areas'),
    url(r'^manage_delivery_area/$', delivery.manage_delivery_area, name='manage_delivery_area'),

    url(r'^upload_image/$', general.upload_image, name='upload_image'),

    url(r'^get_orders/$', order.get_orders, name='get_orders'),
    url(r'^get_order_details/(?P<order_id>[0-9]+)/$', order.get_order_details, name='get_order_details'),
    url(r'^export_orders/$', order.export_orders, name='export_orders'),

    url(r'^get_kitchen_orders/$', order.get_kitchen_orders, name='get_kitchen_orders'),
    url(r'^get_delivery_orders/$', order.get_delivery_orders, name='get_delivery_orders'),

    url(r'^import_meals/$', meals.import_meals, name='import_meals'),    
    url(r'^manage_credits/$', promotions.manage_credits, name='manage_credits'),    
    
    url(r'^create_attribute/$', meals.create_attribute, name='create_attribute'),
    url(r'^list_attributes/$', meals.list_attributes, name='list_attributes'),
    url(r'^delete_attribute/(?P<attribute_id>[0-9]+)/$', meals.delete_attribute, name='delete_attribute'),
)
