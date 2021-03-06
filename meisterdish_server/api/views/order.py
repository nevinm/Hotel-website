'''
Module to handle order related views
'''
import base64
from datetime import datetime, timedelta
from django.conf import settings
from django.core.paginator import Paginator
from django.db.models import Q
from django.db.models.aggregates import Sum
from django.template.loader import render_to_string
import logging
import sys
from thread import start_new_thread

from api.views.decorators import check_input
from libraries import custom_error, json_response, validate_email,\
    validate_phone, check_delivery_area, mail_order_confirmation,\
    save_payment_data, validate_date, send_order_notification_sms,\
    send_failure_mail
from meisterdish_server.models import Order, CartItem, DeliveryTimeSlot,\
    Configuration, Referral, CreditCardDetails, Meal, Address,\
    AmbassadorReferral
import stripe


stripe.api_key = settings.STRIPE_SECRET_KEY
log = logging.getLogger(__name__)


@check_input('POST')
def get_orders(request, data, user):
    '''
    API to get a list of orders
    :param request:
    :param data:
    :param user:
    '''
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", 1)

        order_list = []
        orders = Order.objects.filter(is_deleted=False, cart__user=user)

        total_count = orders.count()

        q = Q()
        # Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num=str(data['num']))

        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":

            for term in str(data['search']).strip().split():
                q &= Q(cart__user__first_name__istartswith=term) | Q(
                    cart__user__last_name__istartswith=term)

        if "status" in data and str(data['status']).strip() != "":
            q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            try:
                q &= Q(delivery_address__phone__startswith=str(
                    int(data['phone'])).strip())
            except:
                return custom_error("Please enter valid phone number")

        if "amount" in data and str(data["amount"]).strip() != "":
            try:
                q &= Q(grand_total=float(data['amount']))
            except:
                return custom_error("Please search with a valid order amount")

        if "date" in data and str(data["date"]).strip() != "":
            # %H:%M:%S")
            date_obj = datetime.strptime(data['date'], "%m/%d/%Y")
            q &= Q(delivery_time__year=date_obj.year) & \
                Q(delivery_time__month=date_obj.month) & \
                Q(delivery_time__day=date_obj.day)

        orders = orders.filter(q)
        # End filter
        orders = orders.order_by("-id")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as error:
            log.error("order list pagination : " + error.message)
            custom_error("There was an error listing orders.")

        # Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order,
                                                     cart__completed=True):
                meals.append(
                    {
                        "id": cart_item.meal.id,
                        "name": cart_item.meal.name,
                        "description": cart_item.meal.description,
                        "image": (settings.DEFAULT_MEAL_IMAGE
                                  if cart_item.meal.main_image is None
                                  else cart_item.meal.main_image.thumb.url),
                        "available": cart_item.meal.available,
                        "sold_out": 1 if cart_item.meal.sold_out else 0,
                        "category": (cart_item.meal.category.name.title()
                                     if cart_item.meal.category else ""),
                        "price": cart_item.meal.price,
                        "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                        "quantity": cart_item.quantity,
                    })

            order_list.append({
                "id": order.id,
                "grand_total": order.grand_total,
                "user_first_name": order.cart.user.first_name,
                "user_last_name": order.cart.user.last_name,
                "status": dict(settings.ORDER_STATUS)[order.status],
                "status_id": order.status,
                "delivery_time": order.delivery_time.strftime(
                    "%m-%d-%Y %H:%M:%S"),
                "order_num": order.order_num,
                "meals": meals,
                "delivery_type": order.delivery_type.title(),
                "phone:": order.phone,

                "delivery_address": {
                    "id": order.delivery_address.id,
                    "first_name": order.delivery_address.first_name,
                    "last_name": order.delivery_address.last_name,
                    "street": order.delivery_address.street,
                    "building": order.delivery_address.building,
                    "city": order.delivery_address.city.title(),
                    "state": order.delivery_address.state.name,
                    "zip": order.delivery_address.zip,
                    "phone": order.delivery_address.phone,
                } if order.delivery_address else "",
                "billing_address": {
                    "id": order.billing_address.id,
                    "first_name": order.billing_address.first_name,
                    "last_name": order.billing_address.last_name,
                    "street": order.billing_address.street,
                    "building": order.billing_address.building,
                    "city": order.billing_address.city.title(),
                    "state": order.billing_address.state.name,
                    "zip": order.billing_address.zip,
                    "phone": order.billing_address.phone,
                } if order.billing_address else "",
            })

        # End format response
        return json_response({"status": 1,
                              "aaData": order_list,
                              "total_count": total_count,
                              "actual_count": actual_count,
                              "num_pages": paginator.num_pages,
                              "page_range": paginator.page_range,
                              "current_page": page,
                              "per_page": limit})
    except Exception as error:
        log.error("Failed to list orders." + error.message)
        return custom_error("Failed to get orders list.")


@check_input('POST')
def create_order(request, data, user):
    '''
    API to create a new order
    :param request:
    :param data:
    :param user:
    '''
    try:
        quantity = 0
        total_price = 0.0
        total_tax = 0.0
        paid = False

        try:
            del_time = data['delivery_time'].strip()
            delivery_time = datetime.strptime(del_time, "%m/%d/%Y %H:%M:%S")
            del_type = data["delivery_type"].strip()

            slot = DeliveryTimeSlot.objects.get(date=delivery_time.date())
            slot_dict = {"16": slot.slot1,
                         "17": slot.slot2,
                         "18": slot.slot3,
                         "19": slot.slot4,
                         "20": slot.slot5}
            slot_val = (slot_dict[str(delivery_time.hour)]
                        if str(delivery_time.hour) in slot_dict.keys()
                        else 0)
            if not slot_val and del_type.lower() != "pickup":
                return custom_error(
                    "No available slots. Please select another time slot.")

        except Exception as error:
            log.error("Invalid delivery time : " + error.message)
            return custom_error("Please provide a valid delivery time.")

        tip = float(data.get('tip', 5))

        if del_type.lower() == "pickup":
            email = data["email"].strip()
            phone = data["phone"].strip()
            if not validate_email(email):
                return custom_error("Please enter a valid email.")
            elif not validate_phone(phone):
                return custom_error("Please enter a valid phone number.")
        else:  # Delivery
            driver_instructions = data.get('driver_instructions', "")
            if 'delivery_address' in data:
                del_address = Address.objects.get(
                    user=user, pk=data['delivery_address'])
            else:
                log.info(
                    "Delivery order but no address given. \
                    Checking Primary address.")
                try:
                    del_address = user.user_address.get(is_primary=True)
                except:
                    log.error(
                        "Delivery order but no address. No Primary address. \
                        Aborting.")
                    return custom_error("Please choose a valid \
                        delivery address.")
            if not check_delivery_area(del_address.zip):
                return custom_error("Delivery is not available at the \
                                    selected location (" +
                                    str(del_address.zip) + ")")

        items = CartItem.objects.filter(cart__user=user, cart__completed=False)
        if not items.exists():
            return custom_error("There are no items in your cart.")

        for item in items:
            if not item.meal.available:
                return custom_error("Sorry, the meal " + item.meal.name +
                                    " is not available.")
            elif item.meal.sold_out:
                return custom_error("Sorry, the meal " + item.meal.name +
                                    " has gone out of stock.")

            quantity += item.quantity
            total_price += item.meal.price * item.quantity
            total_tax += item.quantity * item.meal.price * item.meal.tax / 100

        order = Order()
        order.cart = item.cart
        order.delivery_type = "pickup" if del_type.lower(
        ) == "pickup" else "delivery"
        if del_type.lower() == "delivery":
            order.delivery_address = del_address
            order.driver_instructions = driver_instructions
            email = order.delivery_address.email
            phone = order.delivery_address.phone
            order.tip = tip
        else:
            order.tip = 0

        order.email = email
        order.phone = phone

        order.delivery_time = delivery_time

        order.total_amount = total_price
        order.total_tax = total_tax

        order.total_payable = total_price + total_tax
        if order.delivery_type == "delivery":
            order.total_payable += settings.SHIPPING_CHARGE + tip

        referral_bonus = float(
            Configuration.objects.get(key="REFERRAL_BONUS").value)
        referred = Referral.objects.filter(
            referree=user).exists() and user.credits >= referral_bonus

        if AmbassadorReferral.objects.filter(referree=user).exists():
            ambassador_referrel = True
        else:
            ambassador_referrel = False

        referred_user_first_order = False

        if not Order.objects.filter(cart__user=user).exists():
            # First Order
            if referred:
                user.credits -= referral_bonus / 2  # Half of referral bonus
                order.credits = referral_bonus / 2
                order.total_payable -= referral_bonus / 2
                referred_user_first_order = True
            elif ambassador_referrel:
                if order.delivery_type == "delivery":
                    dis = (
                        total_price + total_tax + settings.SHIPPING_CHARGE) / 2
                else:
                    dis = (total_price + total_tax) / 2
                order.total_payable -= dis
                order.credits = dis
            elif user.credits > 0:
                log.info("User has credits : " + str(user.credits))

                if user.credits > order.total_payable:
                    user.credits = user.credits - order.total_payable
                    order.credits = order.total_payable
                    order.total_payable = 0
                else:
                    order.total_payable = order.total_payable - user.credits
                    order.credits = user.credits
                    user.credits = 0
        else:
            if order.cart.promo_code:
                if order.cart.promo_code.amount > order.total_payable:
                    order.discount = order.total_payable
                    user.credits += order.cart.promo_code.amount - \
                        order.total_payable
                    order.total_payable = 0
                else:
                    order.total_payable -= order.cart.promo_code.amount
                    order.discount = order.cart.promo_code.amount
            elif order.cart.gift_cards.count():
                gc_amount = 0
                gc_amount = order.cart.gift_cards.aggregate(
                    Sum('amount'))["amount__sum"]
                if gc_amount > order    .total_payable:
                    order.discount = order.total_payable
                    user.credits += gc_amount - order.total_payable
                    order.total_payable = 0
                else:
                    order.discount = gc_amount
                    order.total_payable -= gc_amount
            if user.credits > 0:
                log.info("User has credits : " + str(user.credits))

                if user.credits > order.total_payable:
                    user.credits = user.credits - order.total_payable
                    order.credits = order.total_payable
                    order.total_payable = 0
                else:
                    order.total_payable = order.total_payable - user.credits
                    order.credits = user.credits
                    user.credits = 0

        log.info("___Order___")
        log.info("Payable : " + str(order.total_payable))

        if float(order.total_payable) > 0.0:
            # Payment
            order.save_card = bool(data.get("save_card", 0))
            order.card_id = data.get("card_id", False)

            if not order.card_id:
                order.token = data["stripeToken"].strip()
            order.status = 4
            order.save()
            payment = make_payment(order, user, request)

            if not payment:
                return custom_error(
                    "An error has occurred while paying with Credit Card. \
                    Please try agian.")
        else:
            payment = None
        if payment:
            log.info("Order payment success.Payment id :" + str(payment.id))
        else:
            log.info("Order success - Amount = 0..")

        order.payment = payment
        order.status = 0
        order.save()
        user.save()

        if del_type == "delivery":

            if delivery_time.hour == 16:
                slot.slot1 -= 1
            elif delivery_time.hour == 17:
                slot.slot2 -= 1
            elif delivery_time.hour == 18:
                slot.slot3 -= 1
            elif delivery_time.hour == 19:
                slot.slot4 -= 1
            elif delivery_time.hour == 20:
                slot.slot5 -= 1

            slot.save()

        for item in items:
            item.status = 0  # Placed
            item.save()

        if not order.cart.completed:
            order.cart.completed = True
            order.cart.save()

        if referred_user_first_order:
            referrer = Referral.objects.get(referree=user).referrer
            referrer.credits += referral_bonus
            referrer.save()
            log.info("Added referral bonus to referrer: " + str(referrer.id))
        for item in items:
            if item.meal.available - item.quantity < 2:
                item.meal.sold_out = True
                item.meal.available = 1
            else:
                item.meal.available = item.meal.available - item.quantity
            item.meal.save()

        if not send_order_placed_notification(order):
            log.error("Failed to send order notification")
        if not send_order_notification_sms(order):
            log.error("Failed to send order notification SMS")
        cart_items = get_order_cart_items(order)

        start_new_thread(print_order, (order,))

        return json_response({
            "status": 1,
            "message": "Thanks for your order! We've sent you a \
                    confirmation email and are on our way.",
            "cart_items": cart_items})

    except Exception as error:
        log.error("Failed to create order." + str(error.message))
        send_failure_mail(settings.FAILURE_MAIL, 'Checkout Failure',
                          error.message, request, user)
        return custom_error(error.message + "is missing.")


def print_order(order):
    '''
    Function to print order details
    :param order:
    '''
    try:
        pdf_content = save_pdf(order)
        if not pdf_content:
            return False
        from libraries.printnode import api_call
        content = base64.b64encode(pdf_content)
        data = {
            "printerId": settings.PRINTNODE_PRINTER_ID,
            "title": order.order_num,
            "contentType": "pdf_base64",
            "content": content,
            "source": "Meisterdish",
            "options": {"copies": 1, "paper": "A8", "bin": "Tray 1"},
        }
        if api_call('printjobs', data):
            log.info("Printing success")
            return True
        log.error("Prinrt failed")
        return False
    except Exception as error:
        log.error("Failed to print order." + error.message)
        return False


def save_pdf(order):
    '''
    Fucntion to create a pdf corresponding to an order
    :param order:
    '''
    try:
        from libraries.pdfcreator import save_to_pdf
        path = settings.MEDIA_ROOT + \
            "/prints/order_" + order.order_num + ".pdf"
        cart_items = CartItem.objects.filter(cart__order=order)
        if order.delivery_address:
            name = (order.delivery_address.first_name + ' ' +
                    order.delivery_address.last_name).upper()
        elif order.cart.user.role.id == settings.ROLE_USER:
            name = order.cart.user.full_name.upper()
        else:
            name = 'Guest User'
        res = save_to_pdf(
            'print_order_new.html',
            {
                'pagesize': 'A8',
                'order': order,
                'cart_items': cart_items,
                'name': name,
                'date': order.delivery_time.strftime('%A, %B %d %Y'),
                "time": (
                    str(int(order.delivery_time.strftime("%I"))) + " - " +
                    str(int(order.delivery_time.strftime("%I")) + 1) +
                    " " + order.delivery_time.strftime("%p")),
                "static_url": settings.STATIC_URL + '/default/',
            },
            path
        )
        if res:
            log.info("Saved PDF :" + path)
            return res
        log.error("Failed to save PDF for order #" + order.order_num)
        return False
    except Exception as error:
        log.error(
            "Failed to save pdf." + error.message + " type: " +
            str(type(error)))
        return False


def get_order_cart_items(order):
    '''
    Function to get a list of cart items corresponding to an order
    :param order:
    '''
    try:
        cart_list = []
        items_count = 0
        for cart_item in CartItem.objects.filter(cart__order=order).\
                order_by('id'):
            cart_list.append(
                {
                    "id": cart_item.meal.id,
                    "name": cart_item.meal.name,
                    "description": cart_item.meal.description,
                    "image": (
                        settings.DEFAULT_MEAL_IMAGE
                        if cart_item.meal.main_image is None
                        else cart_item.meal.main_image.thumb.url),
                    "available": cart_item.meal.available,
                    "sold_out": 1 if cart_item.meal.sold_out else 0,
                    "category": (
                        cart_item.meal.category.name.title()
                        if cart_item.meal.category else "Not Available"),
                    "price": cart_item.meal.price,
                    "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                    "quantity": cart_item.quantity,
                })
            items_count += cart_item.quantity

        coupon = None
        if items_count > 0:
            cart = cart_item.cart
            if cart.promo_code:
                if cart.promo_code.expiry_date <= datetime.now():
                    cart.promo_code = None
                    cart.save()
                coupon = {
                    "code": cart.promo_code.code,
                    "amount": cart.promo_code.amount,
                    "message": "A credit of $" + "{0:.2f}".format(
                        cart.promo_code.amount) + " has been added."
                }
            elif cart.gift_cards.all().count():
                gc = cart.gift_cards.all()[0]
                coupon = {
                    "code": gc.code,
                    "amount": gc.amount,
                    "message": (
                        "A credit of $" + "{0:.2f}".format(gc.amount) +
                        " has been added.")
                }

        if not len(cart_list):
            return False
        else:
            return {
                "aaData": cart_list,
                "total_count": items_count,
                "delivery_time": (
                    "" if not cart_item.cart.delivery_time
                    else cart_item.cart.delivery_time.strftime(
                        "%m-%d-%Y %H:%M:%S")),
                "delivery_address": (
                    False if not cart_item.cart.delivery_address
                    else cart_item.cart.delivery_address.id),
                "coupon": coupon,
                "credits": order.credits,
                "transaction_id": (order.payment.transaction_id
                                   if order.payment else "Not Available"),
                "tax": "{0:.2f}".format(order.total_tax),
                "shipping": "{0:.2f}".format(settings.SHIPPING_CHARGE),
                "grand_total": "{0:.2f}".format(order.grand_total),
            }
    except Exception as error:
        log.error("Failed to list order cart items." + error.message)
        return False


def make_payment(order, user, request):
    '''
    Function to make payment using stripe API.
    :param order:
    :param user:
    '''
    try:
        if user.stripe_customer_id and \
                str(user.stripe_customer_id).strip() != "":
            customer = stripe.Customer.retrieve(user.stripe_customer_id)
            if order.card_id:
                # Using pre-saved card
                card_id = CreditCardDetails.objects.get(
                    pk=order.card_id).card_id
                card = customer.sources.retrieve(card_id)
            else:
                # Add the entered card to the exising customer
                card = customer.sources.create(source=order.token)
        elif not order.card_id:
            # Create new customer
            customer = stripe.Customer.create(
                source=order.token,
                description="meisterdish_user_" + str(user.id)
            )

            # Save customer id to user table, for future use
            user.stripe_customer_id = customer.id
            user.save()

            cards = customer.sources.all(object="card")
            if cards:
                card = cards.data[0]
            else:
                log.error("Failed to save Stripe card")

            if order.save_card:
                c_card = CreditCardDetails()
                c_card.user = user
                c_card.card_id = card.id
                c_card.number = '#### #### #### ' + str(card.last4)
                c_card.funding = card.funding
                c_card.expire_year = card.exp_year
                c_card.expire_month = card.exp_month
                c_card.card_type = card.brand
                c_card.save()
        else:
            # No customer token, but saved card exists.
            raise Exception(
                'The saved card details does not belong to this user. \
                Please add a new card to make payment.')

        response = stripe.Charge.create(
            amount=int(order.total_payable * 100),  # Cents
            currency="usd",
            customer=customer.id,
            source=card.id,
            description="Meal order at meisterdish.com",
        )

        payment = save_payment_data(response)
        return payment
    except Exception as error:
        exc_type, exc_obj, exc_tb = sys.exc_info()
        log.error(
            "Failed to make payment." + error.message + str(exc_tb.tb_lineno))
        send_failure_mail(settings.FAILURE_MAIL, 'Payment Failure',
                          error.message + str(exc_tb.tb_lineno), request, user)
        return False


def send_order_placed_notification(order):
    '''
    Function to send order placed email notification
    :param order:
    '''
    try:
        meals = Meal.objects.filter(
            cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        to_email = order.email
        day = order.delivery_time.day
        if 4 <= day <= 20 or 24 <= day <= 30:
            suffix = "th"
        else:
            suffix = ["st", "nd", "rd"][day % 10 - 1]

        credit = order.credits + order.discount
        shipping = (0 if order.delivery_type == 'pickup'
                    else settings.SHIPPING_CHARGE)
        gt = order.total_amount + order.total_tax + order.tip + shipping
        if credit > gt:
            credit = gt

        unsubscribe_url = settings.SITE_URL + 'unsubscribe_from_emails/' + \
            base64.b64encode(order.email) + "/"
        delivery_hr = str(order.delivery_time.hour % 12) + \
            "-" + str((order.delivery_time.hour % 12) + 1)
        if order.delivery_time.hour >= 12:
            delivery_hr += " PM"
        else:
            delivery_hr += " AM"

        dic = {
            "order_num": order.order_num,
            "mobile": order.phone,
            "transaction_id": (order.payment.transaction_id if order.payment
                               else "Not Available"),
            "date": order.updated.strftime("%B %d, %Y"),
            "time": order.updated.strftime("%I %M %p"),
            "delivery_time": order.delivery_time.strftime(
                "%A, %B %d" + suffix + ", %Y"),
            "total_amount": "{0:.2f}".format(order.total_amount),
            "discount": "{0:.2f}".format(order.discount),
            "credit": ("-$" if credit > 0 else "$") + "{0:.2f}".format(credit),
            "tax": "{0:.2f}".format(order.total_tax),
            "shipping": (
                '0.00' if order.delivery_type == 'pickup'
                else "{0:.2f}".format(settings.SHIPPING_CHARGE)),
            "tip": "{0:.2f}".format(order.tip),
            "grand_total": "{0:.2f}".format(order.grand_total),
            "first_name": (
                user.first_name.title() if user.role.id == settings.ROLE_USER
                else "Guest"),
            "last_name": (
                user.last_name.title() if user.role.id == settings.ROLE_USER
                else ""),
            "status": order.status,
            "delivery_type": order.delivery_type,
            "to_email": to_email,
            "site_url": settings.SITE_URL,
            "unsubscribe_url": unsubscribe_url,
            "delivery_hr": delivery_hr,
            "referral_code": order.cart.user.referral_code,
            "referral_bonus": Configuration.objects.get(
                key="REFERRAL_BONUS").value,
            "cart_items": order.cart.cartitem_set.all().order_by('id'),
        }
        if order.delivery_type != "pickup":
            dic["is_business"] = order.delivery_address.is_business
            dic["delivery_name"] = order.delivery_address.first_name.title(
            ) + " " + order.delivery_address.last_name.title()
            dic["delivery_company"] = order.delivery_address.company
            dic["delivery_add1"] = order.delivery_address.building + \
                ", " + order.delivery_address.street
            dic["delivery_add2"] = order.delivery_address.city.title(
            ) + ", " + order.delivery_address.state.name + ", " +\
                order.delivery_address.zip

        msg = render_to_string('order_placed_email_template.html', dic)
        sub = 'Your Meisterdish order has been received'

        if not to_email or to_email.strip() == "":
            log.error("No email address to send order placed email")
            return custom_error("Order has been updated, \
                but failed to send email.")
        if mail_order_confirmation([to_email], sub, msg, order):
            log.info("Send order placed mail to " + to_email)
        else:
            log.error("Failed to send order placed mail to " + to_email)

        return True

    except Exception as error:
        log.error("Send confirmation mail : " + error.message)
        return False


@check_input('POST')
def get_order_details(request, data, user, order_id):
    '''
    API to get ordre deatails
    :param request:
    :param data:
    :param user:
    :param order_id:
    '''
    try:
        if user.role.pk == settings.ROLE_ADMIN:
            order = Order.objects.get(pk=order_id, is_deleted=False)
        else:
            order = Order.objects.get(
                pk=order_id, is_deleted=False, cart__user=user)
        meals = []
        for cart_item in CartItem.objects.filter(cart__order=order,
                                                 cart__completed=True):
            meals.append(
                {
                    "id": cart_item.meal.id,
                    "name": cart_item.meal.name,
                    "description": cart_item.meal.description,
                    "image": (
                        settings.DEFAULT_MEAL_IMAGE
                        if cart_item.meal.main_image is None
                        else cart_item.meal.main_image.thumb.url),
                    "available": cart_item.meal.available,
                    "sold_out": 1 if cart_item.meal.sold_out else 0,
                    "category": cart_item.meal.category.name.title(),
                    "price": cart_item.meal.price,
                    "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                    "quantity": cart_item.quantity,
                })
        order_details = {
            "id": order.id,
            "total_amount": order.total_amount,
            "total_tax": order.total_tax,
            "tip": order.tip,
            "delivery_charge": settings.SHIPPING_CHARGE,
            "grand_total": order.grand_total,
            "user_first_name": order.cart.user.first_name,
            "user_last_name": order.cart.user.last_name,
            "user_id": order.cart.user.id,
            "user_image": (
                settings.DEFAULT_USER_IMAGE
                if not order.cart.user.profile_image
                else order.cart.user.profile_image.thumb.url),
            "meals": meals,
            "status": dict(settings.ORDER_STATUS)[order.status],
            "status_id": order.status,
            "delivery_time": order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),

            "delivery_type": order.get_delivery_type_display(),
            "payment_date": (
                order.payment.created.strftime("%m-%d-%Y %H:%M:%S")
                if order.payment else "Not Available"),
            "transaction_id": (
                order.payment.transaction_id if order.payment
                else "Not Available"),
            "order_num": order.order_num,

            "delivery_address": {
                "id": order.delivery_address.id,
                "first_name": order.delivery_address.first_name,
                "last_name": order.delivery_address.last_name,
                "street": order.delivery_address.street,
                "building": order.delivery_address.building,
                "city": order.delivery_address.city.title(),
                "state": order.delivery_address.state.name,
                "zip": order.delivery_address.zip,
                "phone": order.delivery_address.phone,
            },
            "billing_address": {
                "id": order.billing_address.id,
                "first_name": order.billing_address.first_name,
                "last_name": order.billing_address.last_name,
                "street": order.billing_address.street,
                "building": order.billing_address.building,
                "city": order.billing_address.city.title(),
                "state": order.billing_address.state.name,
                "zip": order.billing_address.zip,
                "phone": order.billing_address.phone,
            }
        }
        return json_response({"status": 1, "order": order_details})
    except Exception as error:
        log.error("get order details." + error.message)
        return custom_error("Failed to list order details.")


def get_cart_total(cart):
    '''
    Function to get cart total amount
    :param cart:
    '''
    try:
        amount = 0.0
        for ci in CartItem.objects.filter(cart=cart, cart__completed=False):
            amount += ci.meal.price * ci.quantity
            tax = ci.meal.price * ci.quantity * ci.meal.tax / 100

    except Exception as error:
        log.error("Error getting cart total: " + error.message)
    return amount, tax


def print_pdf(request):
    '''
    Function to print pdf using PrintNode
    :param request:
    '''
    try:
        from libraries.pdfcreator import render_to_pdf
        try:
            order = Order.objects.get(pk=462)
        except:
            order = Order.objects.get(pk=39)
        cart_items = CartItem.objects.filter(cart__order=order)
        return render_to_pdf(
            'print_order.html',
            {
                'pagesize': 'A7',
                'order': order,
                'cart_items': cart_items,
                'date': order.delivery_time.strftime("%m-%d-%Y"),
                "time": (str(int(order.delivery_time.strftime("%I"))) + " - " +
                         str(int(order.delivery_time.strftime("%I")) + 1) +
                         " " + order.delivery_time.strftime("%p")),
                "static_url": settings.STATIC_URL + '/default/',
            }
        )
    except Exception as error:
        log.error("Failed to save pdf." + error.message)
        return False


@check_input('POST')
def get_delivery_slots(request, data):
    '''
    API to get delivery slots
    :param request:
    :param data:
    '''
    try:
        single = False
        if "from_date" in data and str(data["from_date"]).strip() != "":
            from_date = data['from_date'].strip()
            if not validate_date(from_date):
                return custom_error("Please enter a valid from_date.")
        if "to_date" in data and str(data["to_date"]).strip() != "":
            to_date = data['to_date'].strip()
            if not validate_date(to_date):
                return custom_error('Please enter a valid to date')
        else:
            single = True
        log.info("Date validated")
        start_date = datetime.strptime(from_date, '%m-%d-%Y').date()
        log.info("Strp ed start date")
        slots_list = []

        if not single:
            end_date = datetime.strptime(to_date, '%m-%d-%Y').date()
        else:
            end_date = start_date

        day_count = (end_date - start_date).days + 1
        dates = [d for d in (start_date + timedelta(n)
                             for n in range(day_count)) if d.weekday() < 5]
        for d in dates:
            time_slots = DeliveryTimeSlot.objects.filter(date=d)
            if len(time_slots) == 0:
                tmp = DeliveryTimeSlot.objects.filter(
                    date=d - timedelta(days=7))
                if tmp:
                    time_slots = DeliveryTimeSlot.objects.create(
                        date=d, slot1=tmp[0].slot1, slot2=tmp[0].slot2,
                        slot3=tmp[0].slot3, slot4=tmp[0].slot4,
                        slot5=tmp[0].slot5)
                else:

                    time_slots = DeliveryTimeSlot.objects.create(
                        date=d, slot1=0, slot2=0, slot3=0, slot4=0, slot5=0)
            else:
                time_slots = time_slots[0]
            slots = {
                "date": time_slots.date.strftime('%m-%d-%Y'),
                "slot1": time_slots.slot1,
                "slot2": time_slots.slot2,
                "slot3": time_slots.slot3,
                "slot4": time_slots.slot4,
                "slot5": time_slots.slot5,
            }
            slots_list.append(slots)
            time_slots.save()

        return json_response({"status": 1,
                              "aaData": slots_list,
                              "total_count": len(slots_list)})

    except Exception as error:
        log.error("List delivery slot error : " + error.message)
        return custom_error("An error has occurred. Please try again later.")
