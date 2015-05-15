from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from datetime import datetime
from django.core.paginator import Paginator
from libraries import  card, configure_paypal_rest_sdk, verify_paypal_transaction, verify_paypal_ipn
import paypalrestsdk
from django.db.models import Q
import string, random

log = logging.getLogger('order')

#Admin and User
@check_input('POST')
def get_orders(request, data, user=None):
    try:
    	limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        order_list = []
        orders = Order.objects.filter(is_deleted=False).exclude(status=0)
        
        #If user, list only his orders
        if user.role.pk == settings.ROLE_USER:
            orders = orders.filter(cart__user=user)

        total_count = orders.count()

        #Filter
        if "num" in data and str(data['num']).strip() != "":
            orders = orders.filter(order_num=data['num'])
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            orders = orders.filter(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            orders = orders.filter(Q(cart__user__first_name__icontains=data['search']) | Q(cart__user__last_name__icontains=data['search']))
        
        if "status" in data and str(data['status']).strip() != "":
            orders = orders.filter(status=int(data['status']))
        # End filter
        orders = orders.order_by("-id")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as e:
            log.error("order list pagination : " + e.message)
            custom_error("There was an error listing orders.")

        #Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order, cart__completed=True):
                meals.append(
                {
                  "id" : cart_item.meal.id,
                  "name": cart_item.meal.name,
                  "description": cart_item.meal.description,
                  "image": settings.DEFAULT_MEAL_IMAGE if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
                  "available": 1 if cart_item.meal.available else 0,
                  "category": cart_item.meal.category.name.title(),
                  "price": cart_item.meal.price,
                  "tax": cart_item.meal.tax,
                  "quantity":cart_item.quantity,
                })
            
            order_list.append({
                "id":order.id,
                #"total_amount": order.total_amount,
                #"total_tax" : order.total_tax,
                #"tip" : order.tip,
                "grand_total" : order.grand_total,
                "user_first_name" : order.cart.user.first_name,
                "user_last_name" : order.cart.user.last_name,
                #"user_id" : order.cart.user.id,
                #"user_image" : settings.DEFAULT_USER_IMAGE if not order.cart.user.profile_image else order.cart.user.profile_image.thumb.url,
                "status":dict(settings.ORDER_STATUS)[order.status],
                "status_id" : order.status,
                "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                "order_num" : order.order_num,
                "meals":meals,
                "delivery_address" : {
                     "id":order.delivery_address.id,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name,
                     "state":order.delivery_address.city.state.name,
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,
                    },
                "billing_address" : {
                     "id":order.billing_address.id,
                     "first_name":order.billing_address.first_name,
                     "last_name":order.billing_address.last_name,
                     "street":order.billing_address.street,
                     "building":order.billing_address.building,
                     "city":order.billing_address.city.name,
                     "state":order.billing_address.city.state.name,
                     "zip":order.billing_address.zip,
                     "phone":order.billing_address.phone,
                    }
                })

        #End format response
        return json_response({"status":1, 
                              "aaData":order_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
    	log.error("Failed to list orders." + e.message)
    	return custom_error("Failed to get orders list.")

def make_cc_payment_with_details(cc_data, amount, order_num, save_card=0):
    try:
        # Create a card
        cc = card.Card(number=cc_data["number"],
            holder=cc_data["holder"],
            month=int(cc_data["month"]),
            year=int(cc_data["year"]),
            cvc=cc_data["cvc"],
        )
        if not cc.is_valid:
            log.error("User : " + user.email + ": Credit Card is invalid.")
            return "Invalid card details."
        elif cc.is_expired:
            log.error("User : " + user.email + ": Credit Card is expired.")
            return "The card is expired."
        elif save_card:
            save_credit_card(cc)

        funding_instruments = [{
            "credit_card":{
                "type": cc.brand,
                "number": cc_data["number"],
                "expire_month": cc_data["month"],
                "expire_year": cc_data["year"],
                "cvv2": cc_data["cvc"],
                "first_name": cc_data["holder"],
                }
            }]
        return make_cc_payment(funding_instruments, amount, order_num)
    except Exception as e:
        log.error("Failed to pay using CC (with card data)." + e.message)
        return "An error has occurred with payment using card. Please try again."

def save_credit_card(cc):
    try:
        configure_paypal_rest_sdk()
        credit_card = paypalrestsdk.CreditCard({
            "type": cc.brand,
            "number": cc.number,
            "expire_month": cc.month,
            "expire_year": cc.year,
            "cvv2": cc.cvc,
            "first_name": cc.holder,
            })
        res = credit_card.create()
        
        if not res:
            if credit_card.error:
                log.error("Save Credit card error : " + credit_card.error['details'][0]['field'] + " : "+credit_card.error['details'][0]['issue'])
            return custom_error(credit_card.error['details'][0]['field'] + " : " +credit_card.error['details'][0]['issue'])
        
        session = SessionStore(session_key=session_key)
        if session and 'user' in session :
            user = User.objects.get(pk=session['user']['id'])
        else:
            log.error("Anonimous user trying to save CC")
            return False

        c_card = CreditCardDetails()
        c_card.user = user
        c_card.card_id = credit_card.id
        c_card.number = credit_card.number
        c_card.cvv2 = credit_card.cvv2
        c_card.expire_year = exp_year
        c_card.expire_month = exp_month
        c_card.card_type = credit_card.type
        c_card.save()
        return True
    except Exception as e:
        log.error("Save credit card : " + e.message)
        return False

def make_cc_payment_with_saved_card(card_id, amount, order_num):
    try:
        card_id = CreditCardDetails.objects.get(pk=card_id).card_id
        funding_instruments = [{
            "credit_card_token":{
                "credit_card_id" : card_id,
                #"payer_id" : "ppuser12345"
            }
        }]
        return make_cc_payment(funding_instruments, amount, order_num)
    except Exception as e:
        log.error("Failed to pay using CC (Saved card)." + e.message)
        return e.message

def make_cc_payment(funding_instruments, amount, order_num):
    try:
        import paypalrestsdk
        configure_paypal_rest_sdk()
        payment = paypalrestsdk.Payment({
            "intent": "sale",
            "payer": {
                "payment_method": "credit_card",
                "funding_instruments": funding_instruments
            },
            "transactions": [{
                "amount": {
                    "total": "%0.2f" % (amount),
                    "currency": "USD" 
                },
                "description": "Meisterdish Order with ID : "+order_num + " on "+datetime.now().strftime("%m-%d-%Y %H:%M:%S")
            }]
        })
        response = payment.create()
        
        if not response:
            log.error("CC Payment failed :"  + payment.error['details'][0]['field'] + " : "+payment.error['details'][0]['issue'])
            return str(payment.error['details'][0]['field'] + " : "+payment.error['details'][0]['issue'])
        else:
            payment_obj = save_cc_payment(payment, amount)
            if not payment_obj:
                log.info("### NOTE ### . The below payment response is not saved.")
                log.info(payment)
                return "An error has occurred while saving payment response. Please try again later."
        return payment_obj
    except Exception as e:
        log.error("Failed to pay using CC." + e.message)
        return "Failed to pay using credit card."

def save_cc_payment(payment_data, amount):
    try:
        payment = Payment()
        payment.payment_type = "CC"
        payment.response = str(payment_data)
        payment.transaction_id = payment_data["id"]
        payment.amount = amount
        payment.save()
        return payment
    except Exception as e:
        log.error("Failed to save CC payment details." + e.message)
        return False

@check_input('POST')
def create_order(request, data, user):
    try:
        quantity = 0
        total_price = 0.0
        total_tax = 0.0
        paid = False
        
        try:
            del_time = data['delivery_time'].strip()
            delivery_time = datetime.strptime(del_time,"%m/%d/%Y %H:%M:%S")
        except Exception as e:
            log.error("Invalid delivery time : "+e.message)
            return custom_error("Please provide a valid delivery time.")

        driver_instructions = data.get('driver_instructions', "")
        tip = int(data.get('tip', 5))
        if tip < 5:
            return custom_error("Miniumum tip amount is $5.") 

        if 'delivery_address' in data:
            del_address = Address.objects.get(user=user, pk=data['delivery_address'])
        else:
            del_address = user.user_address.get(is_primary=True).id
        
        if 'billing_address' in data:
            bil_address = Address.objects.get(user=user, pk=data['billing_address'])
        else:
            bil_address = user.user_address.get(is_primary=True).id
        
        items = CartItem.objects.filter(cart__user=user, cart__completed=False)
        if not items.exists():
            return custom_error("There are no items in your cart.")
        for item in items:
            if not item.meal.available:
                return custom_error("Sorry, The meal "+ item.meal.name.title() + " has gone out of stock. Please add another meals or continue checkout with out it.")
            
            quantity += item.quantity
            total_price += item.meal.price
            total_tax += item.meal.tax

        total_amount = total_price + total_tax
        
        order = Order()
        order.order_num = token = "MD_ORDER_" + ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        order.cart = item.cart
        
        order.delivery_address = del_address
        order.billing_address = bil_address
        

        order.delivery_time = delivery_time
        order.driver_instructions = driver_instructions
        
        order.total_amount = total_price
        order.total_tax = total_tax
        order.tip = tip

        if "payment_type" not in data:
            return custom_error("Please choose a valid payment type")
         
        elif data["payment_type"].lower() == "cc":
            payment_type = "CC"
            if "card_id" not in data:
                cc_data = {
                    "number" : data["number"],
                    "holder" : data.get("first_name", "") + data.get("last_name", ""),
                    "month" : data['exp_month'],
                    "year" : data["exp_year"],
                    "cvc" : data["cvv2"],
                }

                payment = make_cc_payment_with_details(cc_data, total_amount, order.order_num, data.get("save_card", 0))
            else:
                payment = make_cc_payment_with_saved_card(data["card_id"], total_amount, order.order_num)
            
            if type(payment) == False:
                return custom_error("An error has occurred while payment with Credit Card. Please try agiain.")
            elif type(payment) == str:
                return custom_error(payment)
            else:
                paid = True
                log.info("Order payment (CC) success.Payment id :"+str(payment.id))
        else: #PayPal
            payment_type = "PP"
            
        if paid:
            order.payment = payment
            order.save()
        
        if payment_type == "CC":
            return json_response({"status":1, "message":"The Order has been placed successully."})
        else:
            return json_response({"status":1, "message":"The request has been placed. You will be notified once the payment is verified. "})

    except KeyError as e:
        log.error("Failed to create order." + e.message)
        return custom_error("Failed to place order.")

#Admin only
@check_input('POST', True)
def delete_order(request, data, user, order_id):
    try:
    	order = Order.objects.get(pk=order_id, is_deleted=False)
        order.is_deleted = True
        order.save()
        return json_response({"status":1, "message":"The order has been deleted", "id":order_id+"."})
    except Exception as e:
    	log.error("Delete order." + e.message)
    	return custom_error("Failed to delete the order.")

@check_input('POST')
def get_order_details(request, data, user, order_id):
    try:
        if user.role.pk == settings.ROLE_ADMIN:
            order = Order.objects.get(pk=order_id, is_deleted=False)
        else:
            order = Order.objects.get(pk=order_id, is_deleted=False, cart__user=user)
        meals = []
        for cart_item in CartItem.objects.filter(cart__order=order, cart__completed=True):
            meals.append(
            {
              "id" : cart_item.meal.id,
              "name": cart_item.meal.name,
              "description": cart_item.meal.description,
              "image": settings.DEFAULT_MEAL_IMAGE if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
              "available": 1 if cart_item.meal.available else 0,
              "category": cart_item.meal.category.name.title(),
              "price": cart_item.meal.price,
              "tax": cart_item.meal.tax,
              "quantity":cart_item.quantity,
            })
        order_details = {
            "id": order.id,
            "total_amount": order.total_amount,
            "total_tax" : order.total_tax,
            "tip" : order.tip,
            "grand_total" : order.grand_total,
            "user_first_name" : order.cart.user.first_name,
            "user_last_name" : order.cart.user.last_name,
            "user_id" : order.cart.user.id,
            "user_image" : settings.DEFAULT_USER_IMAGE if not order.cart.user.profile_image else order.cart.user.profile_image.thumb.url,
            "meals":meals,
            "status":dict(settings.ORDER_STATUS)[order.status],
            "status_id" : order.status,
            "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
            "payment_type": order.payment.get_payment_type_display() if order.payment else "Not Available",
            "transaction_id":order.transaction_id,
            "order_num" : order.order_num,
            "delivery_address" : {
                     "id":order.delivery_address.id,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name,
                     "state":order.delivery_address.city.state.name,
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,
                    },
            "billing_address" : {
                     "id":order.billing_address.id,
                     "first_name":order.billing_address.first_name,
                     "last_name":order.billing_address.last_name,
                     "street":order.billing_address.street,
                     "building":order.billing_address.building,
                     "city":order.billing_address.city.name,
                     "state":order.billing_address.city.state.name,
                     "zip":order.billing_address.zip,
                     "phone":order.billing_address.phone,
                    }
        }
        return json_response({"status":1, "order":order_details})
    except Exception as e:
        log.error("get order details." + e.message)
        return custom_error("Failed to list order details.")

#Admin only
@check_input('POST', True)
def update_order(request, data, user, order_id):
    try:
        status = int(data['status'])
        if status < 0 or status > 4:
            log.error("Invalid order status: " + str(status))
        order = Order.objects.get(pk=order_id, is_deleted=False)

        order.status = status
        order.save()
        if status >=1:
            order.cart.completed=True
            order.cart.save()
        return json_response({"status":1, "message":"The order has been updated", "id":order_id+"."})
    except Exception as e:
        log.error("Update order status : " + e.message)
        return custom_error("Failed to update the order.")

@check_nvp_input()
def paypal_success(request, data):
    try:
        log.info("PAYPAL Success")
        log.info(dict(data))
        if "st" not in data or data["st"] != "Completed":
            log.error("PayPal Success: status not 'Completed' : " + data["st"])
            return HttpResponse("Payment failed.")

        txn_id = data["tx"]
        if txn_id.strip() == "":
            return HttpResponse("Invalid payment.")
        
        success = True
        paypal_response = verify_paypal_transaction(txn_id)
        if not paypal_response:
            log.error("Failed to verify paypal transaction.")
            success=False
        else:
            payment = save_payment_data(paypal_response)
            if not payment:
                success = False

        session_key = paypal_response["custom"]
        if session_key == "":
            log.error("PayPal Success: Invalid user session")
            return HttpResponse("Invalid session.")
        try:
            user = user_dic = SessionStore(session_key=session_key)["user"]
        except:
            return HttpResponse("No user session found.")

        try:
            order = Order.objects.get(transaction_id=None, payment=None, cart__completed=False, cart__user__pk=user_dic["id"], status=0)
            if not success:
                return HttpResponse("Failed to verify transaction. Please contact customer support.")

            if float(paypal_response["payment_gross"]) != float(order.grand_total):
                log.error("Paypal success : order and payment amounts not matching.")
                return HttpResponse("The paid amount is different from order amount.")

            order.transaction_id = txn_id
            order.payment = payment
            order.status = 1
            order.save()
            error = ""
        except Exception as e:
            log.error("Paypal success - No valid Order Found with the given transaction ID " + txn_id)
            error = "?error="+e.message
    except Exception as e:
        log.error("Paypal success Error : " + e.message)
        error = "?error=Failed to verify payment."
    return HttpResponseRedirect("http://meisterdish.qburst.com/views/checkout.html" + error)

def save_payment_data(paypal_response):
    try:
        payment =Payment()
        payment.payment_type="pp"
        payment.response = paypal_response["text_response"]
        payment.transaction_id
        payment.transaction_verified = True
        payment.status = True
        payment.amount = float(paypal_response['payment_gross'])
        payment.save()
        return payment
    except Exception as e:
        log.error("Failed to save Paypal payment data on success URl " + e.message)
        return False

@check_nvp_input()
def paypal_ipn(request, data, session_id):
    try:
        log.info("PAYPAL IPN")
        log.info(data)

        session_key = data["custom"]
        if session_key == "":
            log.error("PayPal IPN: Invalid user session")
            return HttpResponse("None")

        user = user_dic = SessionStore(session_key=session_key)["user"]
        payment_data = verify_paypal_ipn(data)
        if not payment_data:
            return HttpResponse("None")
        
        txn_id = data['txn_id']
        try:
            order = Order.objects.get(transaction_id=txn_id, payment=None, cart__completed=False, cart__user__pk=user_dic["id"], status=1)
            
            payment = order.payment
            payment.ipn_verified=True
            payment.ipn_response = payment_data
            payment.save()

        except Exception as e:
            log.error("Paypal IPN No valid Order Found with the given transaction ID " + txn_id)        
            return HttpResponse("None")
    except Exception as e:
        log.error("Paypal IPN ERROR : " + e.message)
        return HttpResponse("None")
    log.error("Paypal IPN Finished")
    return HttpResponse("Done")

