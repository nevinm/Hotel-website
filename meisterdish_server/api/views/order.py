from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from datetime import datetime
from django.core.paginator import Paginator
from libraries import  card, configure_paypal_rest_sdk, verify_paypal_transaction, verify_paypal_ipn, mail, check_delivery_area
import paypalrestsdk
from django.db.models import Q
import string, random
from urllib import unquote
from django.template.loader import render_to_string

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

        q = Q()
        #Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num__istartswith=data['num'])
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            qs = Q()
            for term in str(data['search']).strip().split():
                qs |= Q(cart__user__first_name__icontains=term) | Q(cart__user__last_name__icontains=term)
            q &= qs

        if "status" in data and str(data['status']).strip() != "":
             q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            q &= Q(billing_address__phone=str(data['phone']).strip())

        if "amount" in data and str(data["amount"]).strip() != "":
            q &= Q(grand_total=float(data['amount']))

        if "date" in data and str(data["date"]).strip() != "":
            date_obj = datetime.strptime(data['date'], "%Y-%m-%d")# %H:%M:%S")
            q &= Q(delivery_time__year=date_obj.year) & Q(delivery_time__month=date_obj.month) & Q(delivery_time__day=date_obj.day)            

        orders = orders.filter(q)
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

def make_cc_payment_with_details(cc_data, amount, order_num, save_card=0, user=None):
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
            save_credit_card(cc_data, cc, user)

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
    except KeyError as e:
        log.error("Failed to pay using CC (with card data)." + e.message)
        return "An error has occurred with payment using card. Please try again."

def save_credit_card(cc_data, cc, user):
    try:
        configure_paypal_rest_sdk()
        credit_card = paypalrestsdk.CreditCard({
            "type": cc.brand,
            "number": cc.number,
            "expire_month": cc_data['month'],
            "expire_year": cc_data['year'],
            "cvv2": cc.cvc,
            "first_name": cc.holder,
            })
        res = credit_card.create()
        
        if not res:
            if credit_card.error:
                log.error("Save Credit card error : " + credit_card.error['details'][0]['field'] + " : "+credit_card.error['details'][0]['issue'])
            return custom_error(credit_card.error['details'][0]['field'] + " : " +credit_card.error['details'][0]['issue'])
        

        c_card = CreditCardDetails()
        c_card.user = user
        c_card.card_id = credit_card.id
        c_card.number = credit_card.number
        c_card.cvv2 = credit_card.cvv2
        c_card.expire_year = cc_data['year']
        c_card.expire_month = cc_data['month']
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
        try:
            response = payment.create()
        except Exception as e:
            log.error("CC : PayPal server error : "+str(e.message))    
            return "An error has occurred at payment server. Please try again later."

        if not response:
            log.error("CC Payment failed :"  + payment.error['details'][0]['field'] + " : "+payment.error['details'][0]['issue'])
            return str(payment.error['details'][0]['field']) + " : "+ str(payment.error['details'][0]['issue'])
        else:
            payment_obj = save_cc_payment(payment, amount)
            if not payment_obj:
                log.info("### NOTE ### . The below payment response is not saved.")
                log.info(payment)
                return "An error has occurred while saving payment response. Please try again later."
        return payment_obj
    
    except Exception as e:
        log.error("Failed to pay using CC." + str(e.message))

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
            try:
                del_address = user.user_address.get(is_primary=True).id
            except:
                return custom_error("Please choose a valid delivery address.")
        
        if 'billing_address' in data:
            bil_address = Address.objects.get(user=user, pk=data['billing_address'])
        else:
            try:
                bil_address = user.user_address.get(is_primary=True).id
            except:
                return custom_error("Please choose a valid billing address.")
        
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
        order.order_num = "MD_ORDER_" + ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(12))
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
                if "number" not in data or str(data["number"]).strip() == "":
                    log.error("invalid card number.")
                    return custom_error("Invalid card number.")
                if "exp_month" not in data or str(data["exp_month"]).strip() == "":
                    log.error("Invalid expiry month.")
                    return custom_error("The expiry month is invalid.")
                if "exp_year" not in data or str(data["exp_year"]).strip() == "":
                    log.error("Invalid expiry year.")
                    return custom_error("The expiry year is invalid.")
                if "cvv2" not in data or str(data["cvv2"]).strip() == "":
                    log.error("Invalid cvv.")
                    return custom_error("Invalid CVV.")
                
                cc_data = {
                    "number" : data["number"],
                    "holder" : data.get("first_name", "") + data.get("last_name", ""),
                    "month" : data['exp_month'],
                    "year" : data["exp_year"],
                    "cvc" : data["cvv2"],
                }

                payment = make_cc_payment_with_details(cc_data, total_amount, order.order_num, data.get("save_card", 0), user)
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
            order.status = 1
            order.save()

            if not order.cart.completed:
                order.cart.completed=True
                order.cart.save()
        
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
            "delivery_charge":settings.SHIPPING_CHARGE,
            "grand_total" : order.grand_total,
            "user_first_name" : order.cart.user.first_name,
            "user_last_name" : order.cart.user.last_name,
            "user_id" : order.cart.user.id,
            "user_image" : settings.DEFAULT_USER_IMAGE if not order.cart.user.profile_image else order.cart.user.profile_image.thumb.url,
            "meals":meals,
            "status":dict(settings.ORDER_STATUS)[order.status],
            "status_id" : order.status,
            "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
            
            "payment_type" : order.payment.get_payment_type_display() if order.payment else "Not Available",
            "payment_date" : order.payment.created.strftime("%m-%d-%Y %H:%M:%S") if order.payment else "Not Available",
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

        if status == 2: #Confirmed
            sent = send_order_confirmation_notification(order)
            if not sent:
                log.error("Failed to send order confirmation notification")
        elif status == 4: #Delivered
            sent = send_order_complete_notification(order)
            if not sent:
                log.error("Failed to send order complete notification")

        return json_response({"status":1, "message":"The order has been updated", "id":order_id+"."})
    except Exception as e:
        log.error("Update order status : " + e.message)
        return custom_error("Failed to update the order.")

@check_nvp_input()
def paypal_success(request, data):
    try:
        log.info("PAYPAL Success")
        log.info(dict(data))
        if "st" not in data or data["st"].lower() != "completed":
            log.error("PayPal Success: status not 'Completed' : " + data["st"])
            return HttpResponse("Payment failed.")

        txn_id = data["tx"]
        if txn_id.strip() == "":
            return HttpResponse("Invalid payment.")
        
        if Order.objects.filter(transaction_id=txn_id.strip(), status__gte=1).exists():
            return HttpResponse("Payment already verified")
            raise Exception("Payment already verified")

        paypal_response = verify_paypal_transaction(txn_id)
        pdt = True
        if not paypal_response:
            log.error("Failed to verify paypal transaction.")
            if data["st"] != 'completed': #Immediate return from PayPal
                return HttpResponse("Failed to verify transaction. Please contact customer support.")
            else:
                pdt = False
        else:
            payment = save_payment_data(paypal_response)
            if not payment:
                return HttpResponse("Failed to update transaction details. Please contact customer support.")
        
        if pdt:
            log.info(paypal_response["custom"])
            custom = simplejson.loads(str(unquote(paypal_response["custom"])))
        else:
            log.info(data["cm"])
            custom = simplejson.loads(str(unquote(data["cm"])))

        del_address = Address.objects.get(pk=custom["delivery_address"])
        if not check_delivery_area(del_address.zip):
            raise Exception("Delivery is not available at your location")

        session_key = custom["session-key"]
        if session_key == "":
            log.error("PayPal Success: Invalid user session")
            return HttpResponse("Invalid session.")
        try:
            user_dic = SessionStore(session_key=session_key)["user"]
        except Exception as e:
            log.error("Failed to load session from paypal response")
            return HttpResponse("No user session found.")

        try:
            order = Order()
            order.cart = Cart.objects.get(user__pk=user_dic["id"], completed=False)
            order.order_num = "MD_ORDER_" + ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(12))
            order.tip = float(custom["tip"])
            (price, tax) = get_cart_total(order.cart)

            if float(price) == float(0):
                raise Exception("There are no items in cart or the cart amount is 0.")
            
            if pdt:
                amt = float(paypal_response["payment_gross"])
            else:
                amt = float(data["amt"])
            
            if amt !=  price + tax + order.tip + settings.SHIPPING_CHARGE:
                log.error("Paypal success : order and payment amounts not matching. "+ str(amt) + " != " + str(price + tax + order.tip + settings.SHIPPING_CHARGE))
                return HttpResponse("The paid amount is different from order amount.")
	        
            order.total_amount = price
            order.total_tax = tax
            order.transaction_id = txn_id
            if pdt:
                order.payment = payment
                order.status = 1 
            date_obj = datetime.strptime(str(custom["delivery_time"]), "%m/%d/%Y+%H:%M:%S")
            order.delivery_time = date_obj
            order.billing_address = Address.objects.get(pk=custom["billing_address"])
            order.delivery_address = del_address

            order.driver_instructions = custom["driver_instructions"]
            order.save()
            
            if pdt:
                order.cart.completed=True
                order.cart.save()
                error = "?message=The order is successfull. Order Number : " + order.order_num 
            else:
                error = "?message=The order is placed and is pending verification. Order Number : " + order.order_num 
        except Exception as e:
            log.error("Paypal success error - Failed to create order object " + txn_id + e.message)
            error = "?error="+e.message
        except Cart.DoesNotExist:
            raise Exception("There are no items in cart.")
    except Exception as e:
        log.error("Paypal success Error : " + e.message)
        error = "?error=Failed to verify payment."
    return HttpResponseRedirect(settings.SITE_URL + "views/checkout.html" + error)

def get_cart_total(cart):
    try:
        amount = 0.0
        tax = 0.0
        for ci in CartItem.objects.filter(cart=cart, cart__completed=False):
            amount += ci.meal.price * ci.quantity
            tax += ci.meal.tax * ci.quantity
        
    except Exception as e:
        log.error("Error getting cart total: " + e.message)
    return (amount, tax)

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

        user_dic = SessionStore(session_key=session_key)["user"]
        payment_data = verify_paypal_ipn(data)
        if not payment_data:
            log.error("None")
            return HttpResponse("None")
        
        txn_id = data['txn_id']
        try:
            order = Order.objects.get(transaction_id=txn_id, cart__user__pk=user_dic["id"])
            if order.payment and order.cart.completed and order.status >= 1:
                log.info("IPN transaction " + txn_id + " already verified.")
                return HttpResponse("None")

            payment = save_payment_data(paypal_response)
            if not payment:
                return HttpResponse("Failed to update transaction details. Please contact customer support.")
        
            log.info(paypal_response["custom"])
            custom = simplejson.loads(str(unquote(paypal_response["custom"])))
            session_key = custom["session-key"]
            if session_key == "":
                log.error("PayPal IPN: Invalid user session")
                return HttpResponse("Invalid session.")
            
            try:
                user_dic = SessionStore(session_key=session_key)["user"]
            except Exception as e:
                log.error("IPN : Failed to load session from paypal response")
                return HttpResponse("No user session found.")
            ########
            try:
                order = Order()
                order.cart = Cart.objects.get(user__pk=user_dic["id"], completed=False)
                order.order_num = "MD_ORDER_" + ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(12))
                order.tip = float(custom["tip"])
                (price, tax) = get_cart_total(order.cart)

                if float(price) == float(0):
                    raise Exception("There are no items in cart or the cart amount is 0.")
                
                if pdt:
                    amt = float(paypal_response["payment_gross"])
                else:
                    amt = float(custom["amt"])
                
                if amt !=  price + tax + order.tip + settings.SHIPPING_CHARGE:
                    log.error("Paypal success : order and payment amounts not matching. "+ str(amt) + " != " + str(price + tax + order.tip + settings.SHIPPING_CHARGE))
                    return HttpResponse("The paid amount is different from order amount.")

                order.total_amount = price
                order.total_tax = tax
                order.transaction_id = txn_id
                if pdt:
                    order.payment = payment
                    order.status = 1
                date_obj = datetime.strptime(str(custom["delivery_time"]), "%m/%d/%Y %H:%M:%S")
                order.delivery_time = date_obj
                order.billing_address = Address.objects.get(pk=custom["billing_address"])
                order.delivery_address = Address.objects.get(pk=custom["delivery_address"])

                order.driver_instructions = custom["driver_instructions"]
                order.save()
                
                if pdt:
                    order.cart.completed=True
                    order.cart.save()

                error = "?message=The order is successfull. Order Number : " + order.order_num 
            except Exception as e:
                log.error("Paypal IPN error - Failed to create order object " + txn_id + e.message)
                error = "?error="+e.message
            except Cart.DoesNotExist:
                raise Exception("There are no items in cart.")

            ########3

            order.status = 1
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

def send_order_confirmation_notification(order):
    try:
        meals = Meal.objects.filter(cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        dic = {
               "order_num" : order.order_num,
               "transaction_id" : order.transaction_id,
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "grand_total":order.grand_total,
               "name" : user.last_name + " " + user.first_name,
               "status":order.status,
               }
        
        msg = render_to_string('order_confirmation_email_template.html', dic)
        sub = 'Your order at Meisterdish is confirmed '
        to_email = user.email
        
        mail([to_email], sub, msg )

        if user.need_sms_notification:
            if not send_sms_notification(dic):
                return False
        return True

    except KeyError as e:
        log.error("Send confirmation mail : " + e.message)
        return False

def send_order_complete_notification(order):
    try:
        meals = Meal.objects.filter(cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        dic = {
               "order_num" : order.order_num,
               "transaction_id" : order.transaction_id,
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "grand_total":order.grand_total,
               "name" : user.last_name + " " + user.first_name,
               "status":order.status,
               }
        
        msg = render_to_string('order_complete_email_template.html', dic)
        sub = 'Your order at Meisterdish is complete'
        to_email = user.email
        
        mail([to_email], sub, msg )

        if user.need_sms_notification:
            if not send_sms_notification(dic):
                return False
        return True
    except KeyError as e:
        log.error("Send order completion mail : " + e.message)
        return False

def send_sms_notification(dic):
    try:
        if dic["status"] == 2: #Confirmed
            txt = render_to_string('order_confirmation_sms_template.html', dic)
        else: #Complete
            txt = render_to_string('order_complete_sms_template.html', dic)
        #SEND SMS
        return True
    except KeyError as e:
        log.error("Send order SMS : " + e.message)
        return False
