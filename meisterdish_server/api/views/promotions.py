from django.db.models import Q
from api.views.decorators import *
from django.core.paginator import Paginator
from meisterdish_server.models import GiftCard, PromoCode, CreditCardDetails, Order, Cart, CartItem, Configuration, Referral
from datetime import datetime
import settings , logging
from libraries import save_payment_data, mail
import string, random
from libraries import get_request_user, create_guest_user, validate_email
from django.template.loader import render_to_string
import stripe
stripe.api_key = settings.STRIPE_SECRET_KEY

log = logging.getLogger('api')


@check_input('POST')
def gift_card_order(request, data, user=None):
    try:
        name = data["name"].strip()
        email = data["email"].strip()
        message = data["message"].strip()
        amount = data["amount"]
        if name == "" or email == "" or message == "":
            return custom_error("Please provide valid details.")
        elif not validate_email(email):
            return custom_error("Please provide valid email.")
        elif float(amount) < 25:
            return custom_error("The minimum gift card amount should be $25.")

        user = get_request_user(request)
        if not user or user.role.id == settings.ROLE_GUEST:
            (user, session_key) = create_guest_user(request, data)
        else:
            session_key = None

        save_card = bool(data.get("save_card", 0))
        card_id = data.get("card_id", False)
        
        if not card_id:
            token = data["stripeToken"].strip()

        if user.stripe_customer_id and str(user.stripe_customer_id).strip() != "":
            customer = stripe.Customer.retrieve(user.stripe_customer_id)
            if card_id:
                #Using pre-saved card
                card_id = CreditCardDetails.objects.get(pk=card_id).card_id
                card = customer.sources.retrieve(card_id)
            else:
                #Add the entered card to the exising customer
                card = customer.sources.create(source=token)
        elif not card_id:
            #Create new customer
            customer = stripe.Customer.create(
                source=token,
                description="meisterdish_user_"+str(user.id)
            )

            #Save customer id to user table, for future use
            user.stripe_customer_id = customer.id
            user.save()

            cards = customer.sources.all(object="card")
            if cards:
                card = cards.data[0]
            else:
                log.error("Failed to save Stripe card")
            
            if save_card:
                c_card = CreditCardDetails()
                c_card.user = user
                c_card.card_id = card.id
                c_card.number = '#### #### #### '+str(card.last4)
                c_card.funding = card.funding
                c_card.expire_year = card.exp_year
                c_card.expire_month = card.exp_month
                c_card.card_type = card.brand
                c_card.save()


        response = stripe.Charge.create(
            amount=int(amount * 100), #Cents
            currency="usd",
            customer=customer.id,
            source = card.id,
            description = "Gift Card order at meisterdish.com",
            #receipt_number = user.email,
            #receipt_email = user.email
        )

        log.info(response)
        payment =  save_payment_data(response)
        if not payment:
            return custom_error("Failed to make payment. Please try again later.")
        
        code = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(6))

        gc = GiftCard()
        gc.user = user
        gc.code = code
        gc.name = name
        gc.email = email
        gc.message = message
        gc.amount = amount
        gc.payment = payment
        gc.used=False
        gc.save()
        
        if not gc.id:
            log.error("Gift card payment success, but failed to create card.")
            return custom_error("Failed to create GiftCard. Please contact customer support.")

        if send_gift_card(gc):
            return json_response({"status":1, "message":"The Gift Card coupon has been sent to " + gc.email, "id":gc.id})
        else:
            log.error("Gift card created, but failed to send.")
            return custom_error("There was an error sending Gift Card. Please contact customer support.")
    except Exception as e:
        log.error("Buy gift card error : " + e.message)
        return custom_error(e.message)

def send_gift_card(gc):
    try:
        dic = {
            "code" : gc.code,
            "name" : gc.name,
            "message":gc.message,
            "first_name" : gc.user.first_name.title(),
            "last_name" : gc.user.last_name.title(),
            "amount" : str(gc.amount),
            "url" : settings.SITE_URL,
            "email":gc.email,
        }

        msg = render_to_string('gift_card_email.html', dic)
        sub = 'Your Gift Card for Meisterdish'    
            
        mail([gc.email], sub, msg )
        return True
    except Exception as e:
        log.error("Failed to send gift card mail : "+e.message)
        return False

def get_cart_total(cart):
    try:
        cart_items = CartItem.objects.filter(cart=cart, cart__completed=False)
        total_price = 0
        total_tax = 0
        discount = 0
        credits = 0

        for ci in cart_items:
            total_price += ci.meal.price * ci.quantity
            total_tax += ci.quantity * ci.meal.price * ci.meal.tax / 100

        referral_bonus = float(Configuration.objects.get(key="REFERRAL_BONUS").value)
        referred = Referral.objects.filter(referree=cart.user).exists() and user.credits >= referral_bonus
        if not Order.objects.filter(cart__user=cart.user, cart__user__role__pk=settings.ROLE_USER).exists() and referred:
            credits = referral_bonus
        else:
            credits = cart.user.credits
            if cart.promo_code:
                discount = cart.promo_code.amount
            elif cart.gift_cards.all().count():
                for gc in cart.gift_cards.all():
                    discount += gc.amount
            if discount > total_price + total_tax :
                discount = total_price + total_tax
        return (total_price, total_tax, discount, credits)
    except Exception as e:
        log.error("Cart total method :"+e.message)
        return (0, 0, 0, 0)

@check_input('POST')
def apply_promocode(request, data, user):
    try:
        #First order and referral bonus available        
        if not Order.objects.filter(cart__user=user).exists() and Referral.objects.filter(referree=user).exists() and user.credits > 0:
            return custom_error("Sorry, you can not apply further promotional codes to this order")

        cart = Cart.objects.get(completed=False, user=user)
        if cart.promo_code:
            return custom_error("You cannot apply more than one promo code for a single transaction.")

        code = data["code"].strip()

        try:
            code_obj = PromoCode.objects.get(code=code, deleted=False)
            if code_obj.expiry_date < datetime.now():
                return custom_error("Sorry, the promo code ("+ code +") has expired.")
            cart.promo_code = code_obj
            code_type = "Promocode "
            amt = code_obj.amount
        except PromoCode.DoesNotExist:
            try:
                gift_card = GiftCard.objects.get(code=code)
                if gift_card.used:
                    return custom_error("This code is already redeemed.")
                elif cart.gift_cards.all().count() >= 1:
                    return custom_error("You cannot add more than one gift card for a single transaction.")
                else:
                    cart.gift_cards.add(gift_card)
                    gift_card.used=True
                    gift_card.save()
                    code_type = "Gift card "
                    amt = gift_card.amount
            except Exception as e:
                log.error(e.message)
                return custom_error("Sorry, the code("+ code +") is invalid.")

        cart.save()

        (total_price, total_tax, discount, credits) = get_cart_total(cart)

        return json_response({"status":1, "message":code_type + code + " has been applied. You will get a discount of "+str(amt), 
            "amount":total_price,
            "tax":total_tax,
            "discount":discount,
            "credits":credits,
            "code":code
        })
    except Cart.DoesNotExist:
            return custom_error("Please add some meals to cart before applying code.")
    except Exception as e:
        log.error("Failed to apply promo code/gift card." + e.message)
        return custom_error("Failed to apply promo code / gift card.")

@check_input('POST')
def remove_promocode(request, data, user):
    try:
        cart = Cart.objects.get(completed=False, user=user)
        if cart.promo_code:
            cart.promo_code = None
            code_type = "Promocode"
        elif cart.gift_cards.all().count() != 0:
            gc = cart.gift_cards.all()[0]
            gc.used = False
            gc.save()
            cart.gift_cards = []
            code_type = "Gift card"
        else:
            return custom_error("There are no coupons applied to this transaction.")
        cart.save()

        (total_price, total_tax, discount, credits) = get_cart_total(cart)

        return json_response({"status":1, "message":"Removed "+code_type, 
            "amount":total_price,
            "tax":total_tax,
            "discount":discount,
            "credits":credits,
        })
    except Cart.DoesNotExist:
            return custom_error("There are no meals added to this transaction.")
    except Exception as e:
        log.error("remove promocode." + e.message)
        return custom_error("An error has occurred. Please try again.")