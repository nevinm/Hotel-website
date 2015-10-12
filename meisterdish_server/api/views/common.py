from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from meisterdish_server.models import *
import md5, base64
import logging 
import settings
from datetime import datetime
from django.db.models import Q
from django.template.loader import render_to_string
from api.views.decorators import *
import sys, traceback
from libraries import manage_image_upload, check_delivery_area, add_to_mailing_list, validate_email
log = logging.getLogger(__name__)

def home(request):
    return HttpResponse("Welcome to Meisterdish")

@check_input('POST')
def login(request, data):
    try:
        email = data['username'].strip()
        valid = False
        
        if "password" in data:
            password = data['password'].strip()
            remember = str(data['remember']).strip()
            if email == '' or password == '':
                log.error("Empty email or password.")
                raise Exception("Invalid email or password")
            
            if 'is_admin' in data and data['is_admin'] == 1:
                role_id = 1
            else:
                role_id = 2    
            user = User.objects.get(email__iexact=email, role__id=role_id, deleted=False)
                
            if md5.new(password).hexdigest() == user.password:
                valid = True
            else:
                return custom_error("Invalid email or password.")
                
        else:
            try:
                fb_id = data["fb_id"].strip()
                user = User.objects.get(fb_user_id=fb_id, email__iexact=email, deleted=False)
            except:
                return custom_error("No user found with the given details")
            else:
                valid = True
            remember = 0
        
        if valid:
            if not user.is_active:
                return json_response({"status":-1, "message":"The user is not active. Please activate the account using the link from verification email."})
            log.info(user.email + " logged in")
            
                
            user_dic = {"id":user.id,
                              "email":user.email,
                              "first_name":user.first_name.title(),
                              "last_name":user.last_name.title(),
                              "role" : user.role.id,
                              }
            
            session_key = request.META.get('HTTP_SESSION_KEY', None)
            if session_key :
                session = SessionStore(session_key=session_key)
                log.info("Logging in to guest session")
                try:
                    guest_user = User.objects.get(pk=session["user"]["id"], role__pk=settings.ROLE_GUEST)
                    try:
                        my_cart = Cart.objects.get(user__email=user.email, completed=False)
                    except Cart.DoesNotExist:
                        try:
                            guest_cart = Cart.objects.get(user=guest_user, completed=False)
                            guest_cart.user = user
                            guest_cart.save()
                        except Cart.DoesNotExist:
                            pass
                    else:
                        try:
                            guest_cart = Cart.objects.get(user=guest_user, completed=False)
                        except Cart.DoesNotExist:
                            pass
                        else:
                            for ci in CartItem.objects.filter(cart=guest_cart):
                                my_ci = CartItem.objects.filter(cart=my_cart, meal__pk=ci.meal.id)
                                if my_ci.exists():
                                    my_ci[0].quantity = ci.quantity
                                    my_ci[0].save()
                                    ci.delete()
                                else:
                                    ci.cart = my_cart
                                    ci.save()
                                
                            guest_cart.delete()

                    session.delete()
                    session = SessionStore()
                    session.create()
                    log.info("User Logged in to guest session. cart updated")
                except Exception as e:
                    log.error("No guest session found with guest user/no cart in guest session" + e.message)
                else:
                    guest_user.delete()

            else:
                log.info("New session")
                session = SessionStore()
                session.create()
            
            session["user"] = user_dic
            if str(remember) == "1":
                session.set_expiry = 0
            else:
                session.set_expiry = settings.SESSION_EXPIRY
            session.save()

            log.info(email + " logged in ..")
            return json_response({"status":1, "message": "Logged in succesfully", "user":user_dic, "session_key":session.session_key})
        else:
            log.error("Login failed")
            raise Exception("Invalid Username or Password.")
    
    except Exception as e:
        log.error("Login : " + e.message)
        return json_response({"status":-1, "message": "Invalid Username or Password."})

@check_input('POST')
def logout(request, data):
    if 'HTTP_SESSION_KEY' not in request.META:
        log.error("API:logout, Invalid session.")
        response = {'status':-1, "message": "Invalid session."}
    else:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        if 'user' in session:
            del session['user']
        session.flush()
        log.info("API:logout, success")
        response = {'status': 1, "message" : "Successfully logged out"}
    return json_response(response)

@check_input('POST')
def signup(request, data):
    try:
        password = data['password'].strip()
        email = data['email'].strip().lower()
        first_name = data['first_name'].strip()
        last_name = data['last_name'].strip()
        zipcode = data["zipcode"].strip()
        
        referral_code = data.get("referral_code", False)

        fb = False
        fb_id = ""
        profile_image = None
        if 'fb_id' in data:
            fb_id = data['fb_id']
            fb = True
            
            if 'image_url' in data and data['image_url'].strip() != '':
                profile_image_url = data['image_url'].strip()
                profile_image = Image()
                profile_image.save_image_from_url(profile_image_url)
            
        
        if password == '' or first_name == '' or last_name == '' or email == '':
            log.error(email + " : Sign up failed. Fill required fields.")
            return custom_error("Please fill in all the required fields")
        
        if User.objects.filter(email__iexact=email).exists():
            return custom_error("Email already exists.")
        try:
            user = User()
            user.email = email
            user.password = md5.new(password).hexdigest()
            user.first_name = first_name
            user.last_name = last_name
            user.role = Role.objects.get(pk=2)
            user.fb_user_id = fb_id
            user.profile_image = profile_image
            user.zipcode = zipcode
            user.save()

            if referral_code:
                try:
                    referrer = User.objects.get(referral_code=referral_code)
                    bonus = float(Configuration.objects.get(key='REFERRAL_BONUS').value)
                    user.credits = bonus
                    user.save()               
                    # Commented - awarded up on first transaction only
                    # referrer.credits += bonus
                    # referrer.save()

                    referral = Referral()
                    referral.referrer = referrer
                    referral.referree = user
                    referral.save()
                except Exception as e:
                    log.error("Signup - The referrer code " + referral_code + "is invalid : " + e.message)

            user_dic = {"id":user.id,
                                  "email":user.email,
                                  "first_name":user.first_name,
                                  "last_name":user.last_name,
                                  "role":user.role.id,
                                  }
            
            log.info(user.email + " signed up")
            
            session_key = request.META.get('HTTP_SESSION_KEY', None)
            if session_key :
                session = SessionStore(session_key=session_key)
                log.info("Logging in to guest session")
                if 'user' in session and session["user"]["id"] != user.id:
                    log.error("User " + email + "logging in to the session for " + session["user"]["email"] + ": REJECTED")
                    return custom_error("Invalid session.")
            else:
                session = SessionStore()
                session.create()
                
            session["user"] = user_dic
            session.set_expiry = settings.SESSION_EXPIRY
            session.save()
            
            log.info(email + " : Signed up ")
            if send_user_verification_mail(user):
                log.info("Sent verification mail to " + user.email)
                return json_response({"status":1, "message": "A verification email has been sent to your email (" + email + "). Please follow the instructions to activate your account.", "user":user_dic, "session_key":session.session_key})
            else:
                log.error("Failed to send user verification mail : ")
                return custom_error("An error has occurred in sending verification mail. Please try later.")
        except Exception as e:
            log.error(email + " : Failed to sign up " + e.message)
            return custom_error("Failed to sign up. Please try again later")
    except KeyError as field:
        log.error("failed to signup " + str(field) + "missing")
        return custom_error("Invalid input")
    except Exception as e:
        log.error("Failed to signup " + e.message)
        return custom_error("Failed to signup. Please check all the fields.")

def send_user_verification_mail(user, change_email=False, email=""):
    try:
        import string, random
        from libraries import mail
    
        token = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        if change_email:
            link = settings.SITE_URL + 'verify-email/' + token + "/"
            token = token + "-" + email
        else:
            link = settings.SITE_URL + 'verify-user/' + token + "/"
        
        user.user_verify_token = token
        user.save()
        unsubscribe_url = settings.SITE_URL + 'unsubscribe_from_emails/' + base64.b64encode(user.email) + "/"
        dic = {
               "email" : user.email,
               "link" : link,
               "first_name" : user.first_name.title(),
               "last_name" : user.last_name.title(),
               "username" : user.email,
               "site_url":settings.SITE_URL,
               "unsubscribe_url": unsubscribe_url,
               }
        if change_email:
            dic["email"] = email
            dic["username"] = email
            msg = render_to_string('verify_email_email_template.html', dic)
            sub = 'Verify your email for Meisterdish'
            to_email = email
        else:
            msg = render_to_string('verify_user_email_template.html', dic)
            sub = 'Verify your account for Meisterdish'
            to_email = user.email
        
        mail([to_email], sub, msg,design=False)
        log.info("Sent verification mail to " + to_email)
    except Exception as e:
        log.error("Failed to send user verification mail : " + e.message)
        return False
    return True

@check_input('GET')
def verify_user(request, data, token):
    login_url = settings.SITE_URL + "views/login.html"
    fail_url = settings.SITE_URL + "views/signup-fail.html"
    try:
        token = token.strip()
        
        user = User.objects.get(user_verify_token=token)
        
        user.user_verify_token = ""
        user.is_active = True
        user.save()
        
        log.info("Verified user " + user.email)

        if not check_delivery_area(user.zipcode):
            log.error("User's zip code not available.")
            add_to_mailing_list(user.email, user.zipcode)
            return HttpResponseRedirect(fail_url)        

        return HttpResponseRedirect(login_url + "?account_verify=true")
    
    except KeyError as field:
        log.error("verify request request missing " + field.message)
        return HttpResponseRedirect(login_url + "?account_verify=false&error=Invalid+token")

    except User.DoesNotExist:
        log.error("Verify : No user found with given token")
        return HttpResponseRedirect(login_url + "?account_verify=false&error=Invalid+token+or+the+user+is+already+verified.")

    except Exception as e:
        log.error("Validate token : Exception : " + e.message)
        return HttpResponseRedirect(login_url + "?account_verify=false&error=Failed+to+verify+this+user.")

@check_input('GET')
def verify_email(request, data, token):
    login_url = settings.SITE_URL + "views/menu.html"
    # login_url = "http://10.1.4.87/MeisterDish/meisterdish/web/views/menu.html"
    try:
        token = token.strip()
        
        user = User.objects.get(user_verify_token__startswith=token)
        
        token = user.user_verify_token[0:20]
        email = user.user_verify_token[20:].strip("-")
        
        user.user_verify_token = ""
        user.email = email
        user.save()
        
        log.info("Verified email " + user.email)
        return HttpResponseRedirect(login_url + "?email_verify=true")
    
    except KeyError as field:
        log.error("verify email request missing " + field.message)
        return HttpResponseRedirect(login_url + "?email_verify=false")

    except User.DoesNotExist:
        log.error("Verify : No user found with given token")
        return HttpResponseRedirect(login_url + "?email_verify=false")

    except Exception as e:
        log.error("Validate token : Exception : " + e.message)
        return HttpResponseRedirect(login_url + "?email_verify=false")

@check_input('POST')
def forgot_password(request, data):
    try:
        email = data['email'].strip()
        
        user = User.objects.get(email=email)
        
        import string, random
        from libraries import mail
        
        token = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        # link = settings.BASE_URL + 'password_reset_return/'+token+"/"
        link = settings.SITE_URL + "views/reset-password.html?token=" + token
        user.password_reset_token = token
        user.save()
        unsubscribe_url = settings.SITE_URL + 'unsubscribe_from_emails/' + base64.b64encode(user.email) + "/"
        dic = {
               "to_email" : email,
               "link" : link,
               "first_name" : user.first_name.title(),
               "last_name" : user.last_name.title(),
               "username" : user.email,
               "site_url":settings.SITE_URL,
               "unsubscribe_url": unsubscribe_url,
               }
        msg = render_to_string('forgot_password_email_template.html', dic)

        res = mail([email], 'Reset your password for Meisterdish', msg,design=False)
        log.info(res)
    except KeyError as field:
        log.error("Forgot password request missing " + field.message)
        return custom_error("Invalid input.")
    except User.DoesNotExist as e:
        log.error("Forgot password request with non-existing email: " + email)
        return custom_error("No user exists with the given email address.")
    except Exception as e:
        log.error("Failed to send the password reset email : " + e.message)
        return custom_error("Failed to send the password reset email.")
    else:
        log.info("Reset password mail sent to : " + email)
        return json_response({"status":1, "message":"Password reset link has been sent to " + user.email + "."})

@check_input('POST')
def reset_password(request, data):
    try:
        token = data['token'].strip()
        new_password = data['password'].strip()
        user = User.objects.get(password_reset_token=token)
        
        user.password_reset_token = ""
        user.password = md5.new(new_password).hexdigest()
        user.save()
        
        log.info("Password reset for user " + user.email)
        return json_response({"status":1, "message":"Your password has been reset."})
    
    except KeyError as field:
        log.error("Reset password request missing " + field.message)
        return custom_error("Invalid input.")
    except User.DoesNotExist:
        log.error("Reset password : No user found with given token")
        return custom_error("Invalid token.")
    except Exception as e:
        log.error("Validate token : Exception : " + e.message)
        return custom_error("Failed to reset password. Please try again later.")

@check_input('POST')
def change_password(request, data, user):
    try:
        
        user_id = user.id
        old_password = data['old_password'].strip()
        new_password = data['new_password'].strip()
        
        if  md5.new(old_password).hexdigest() != user.password:
            return custom_error("The current password you have entered is incorrect.")
        
        user.password = md5.new(new_password).hexdigest()
        user.password_reset = False
        user.save()
        
        log.info("user : " + user.email + " : changed password")
        return json_response({"status":1, "message":"Password changed successfully."})
    except Exception as e:
        log.error("Change password failed : " + e.message)
        return custom_error("Failed to change the password.")

@check_input('POST')
def get_profile(request, data, user):
    try:
        if not user.is_active:
            raise Exception("The user is not active.")
        
        cart_items = Meal.objects.filter(cartitem__cart__user=user)
        meals = []
        if cart_items.count:
            for meal in cart_items:
                meals.append({
                              'id' : meal.id,
                              'name' : meal.name,
                              'decription' : meal.description,
                              'price' : meal.price,
                              'tax' : meal.tax,
                              'image_url':settings.DEFAULT_MEAL_IMAGE if not meal.main_image else meal.main_image.thumb.url,
                              })
        address_list = []
        addresses = Address.objects.filter(user=user)
        for add in addresses:
            address_list.append({
                                 "id":add.id,
                                 "first_name":add.first_name,
                                 "last_name":add.last_name,
                                 "is_primary":1 if add.is_primary else 0,
                                 "street":add.street,
                                 "building":add.building,
                                 "city":add.city.title(),
                                 "state":add.state.name,
                                 "zip":add.zip,
                                 "phone":add.phone,
                                 })
            
        user_data = {
                     "status":1,
                     "id" : user.id,
                     "name" : (user.last_name + " " + user.first_name).title(),
                     "email" : user.email,
                     "mobile" : user.mobile,
                     "profile_image" : settings.DEFAULT_USER_IMAGE if not user.profile_image else user.profile_image.image.url,
                     "profile_image_thumb" : settings.DEFAULT_USER_IMAGE if not user.profile_image else user.profile_image.thumb.url,
                     "is_admin":True if user.role.id == 1 else False,
                     "meals_in_cart" : meals,
                     "meals_in_cart_count" : len(meals),
                     "credits" : "{0:.2f}".format(user.credits),
                     "email_promotions" : user.need_email_promotions,  # need_sms_notification,
                     "address_list" : address_list,
                     "first_name" : user.first_name.title(),
                     "last_name" : user.last_name.title(),
                     "stripe_id":user.stripe_customer_id if user.stripe_customer_id else "",
                     "referral_code" : settings.SITE_URL + 'share/' + user.referral_code + '/',
                     }
        return json_response(user_data)
    except KeyError as e:
        log.error("Profile request with no user_id")
        return custom_error("Invalid input.")
    except Exception as e:
        log.error("Get profile :Exception: " + e.message + str(traceback.tb_lineno(sys.exc_info()[2])))
        return custom_error("Failed to retrieve profile details.")

@check_input('POST')
def edit_profile(request, data, user):
    try:
        if 'first_name' in data:
            user.first_name = data['first_name'].strip()
        
        if 'last_name' in data:    
            user.last_name = data['last_name'].strip()
        
        if 'mobile' in data:
            mob = str(data['mobile']).strip()
            if len(mob) < 10 or len(mob) > 13:
                return custom_error("Please enter a valid phone number.")
            user.mobile = mob
            
        try:
            if "profile_picture_id" in data:
                user.profile_image = Image.objects.get(pk=data['profile_picture_id'].strip())
        except Exception as e:
            log.error("Failed to get the profile picture " + e.message)
            return custom_error("The Profile image does not exist. Please try again.")
        
        sms = False
        if "sms_notification" in data and str(data['sms_notification']) == '1':
            sms = True
        
        user.need_sms_notification = sms
        user.save()
        
        log.info("user : " + user.email + " : updated profile")
        return json_response({"status":1, "message":"Profile updated successfully."})
    except Exception as e:
        log.error("user id : " + str(user.id) + " : profile update failed : " + e.message)
        return custom_error("Failed to update profile.")

@check_input('POST')
def get_cities(request, data, user):
    try:
        city_list = []
        limit = 20
        
        cities = City.objects.filter(state__id=data["state_id"])
            
        if "search" in data:
            search = data["search"].strip()
            cities = cities.filter(name__istartswith=search)
        
        cities = cities[:limit]
        for c in cities:
            city_list.append({
                              "id":c.id,
                              "name":c.name,
                              "state_id":c.state.id,
                              "state": c.state.name,
                              })
        return json_response({"status":1, "city_list":city_list})
    except Exception as e:
        log.error("Failed to send city list : " + e.message)
        return custom_error("Failed to retrieve city list.")
    
@check_input('POST')
def get_states(request, data, user):
    try:
        state_list = []
        if not "country_id" in data:
            data["country_id"] = 1
        states = State.objects.filter(country__id=data["country_id"])
        
        if "search" in data:
            search = data["search"].strip()
            states = State.objects.filter(name__istartswith=search)
            
        for s in states:
            state_list.append({
                              "id":s.id,
                              "name":s.name,
                              "country_id":s.country.id,
                              "country": s.country.name,
                              })
        return json_response({"status":1, "state_list":state_list})
    except Exception as e:
        log.error("Failed to send state list : " + e.message)
        return custom_error("Failed to retrieve state list.")

@check_input('POST')
def change_email(request, data, user):
    try:
        if "email" in data and data["email"].strip() != "":
            email = data["email"].strip()
            if not validate_email(email):
                return custom_error("Please provide a valid email.")
            if user.email == email:
                raise Exception("Please enter a different email.")
            elif User.objects.filter(email=email).exists():
                raise Exception("Email already exists for another user.")
            else:
                if send_user_verification_mail(user, True, email):
                    log.info("Sent verification mail to " + email)
                    return json_response({"status":1, "message": "A verification email has been sent to your email (" + email + "). Please follow the link in verification email to verify."})
                else:
                    log.error("Failed to send user verification mail : " + email)
                    return custom_error("An error has occurred in sending verification mail. Please try later.")

                user.email = email
                user.save()
                
        if "email_promotion" in data:
            promo = int(str(data['email_promotion']).strip())
            user.need_email_promotions = bool(promo)
            user.save()

        return json_response({"status":1, "message":"Updated successfully.", "email_promotion":user.need_email_promotions})
    except Exception as e:
        log.error("Failed to change email : " + e.message)
        return custom_error("Failed to change email.")

@check_input('POST')
def get_address_list(request, data, user):
    try:
        address_list = []
        addresses = Address.objects.filter(user=user).order_by('-id')
        delivery_address = 0

        for add in addresses:
            # if 'checkout' in data and data['checkout'] == 1 and not check_delivery_area(add.zip):
            #    continue
            if add.is_primary:
                delivery_address = add.id
            address_list.append({
                                 "id":add.id,
                                 "first_name":add.first_name,
                                 "last_name":add.last_name,
                                 "is_primary":1 if add.is_primary else 0,
                                 "is_business":1 if add.is_business else 0,
                                 "company" : add.company,
                                 "street":add.street,
                                 "building":add.building,
                                 "city":add.city.title(),
                                 # "city_id":add.city.id,
                                 "state":add.state.name,
                                 "state_id":add.state.id,
                                 "zip":add.zip,
                                 "phone":add.phone,
                                 "email":add.email,
                                 "delivery" : True if check_delivery_area(add.zip) else False,
                                 })
        try:
            del_address = Cart.objects.get(user=user, completed=False).delivery_address
            if del_address and del_address in addresses:
                delivery_address = del_address.id
        except:
            pass
        return json_response({"status":1, "address_list":address_list, "delivery_address":delivery_address})
    except Exception as e:
        log.error("Failed to send address list : " + e.message)
        return custom_error("Failed to retrieve address list")

# For uploading profile picture
@check_input('POST')
def upload_picture(request, data, user):
    try:
        response = manage_image_upload(request)
        if response is None:
            return custom_error("There was an error uploading profile picture. Please try again later.")

        user.profile_image = Image.objects.get(pk=response['id'])
        user.save()
        return json_response(response)
    except Exception as e:
        log.error("Failed to upload profile picture : " + e.message)
        return custom_error("Failed to upload profile picture. Please try again later.")

@check_input('GET')
def referral_return(request, data, token):
    if not len(token):
        log.error("Invalid referral token")
        return HttpResponseRedirect(settings.SITE_URL)
    if User.objects.filter(referral_code=token).exists():
        return HttpResponseRedirect(settings.SITE_URL + 'views/signup.html?ref=' + token)
    else:
        log.error("Invalid referral token")
        return HttpResponseRedirect(settings.SITE_URL)

@check_input('POST')
def validate_session(request, data):
    try:
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        if session_key :
            session = SessionStore(session_key=session_key)
            if session and 'user' in session :
                query = Q(pk=session['user']['id']) & (Q(role__pk=settings.ROLE_USER) | Q(role__pk=settings.ROLE_GUEST))
                user = User.objects.get(query)
                return json_response({"status":1, "role":user.role.name.title()})
    except Exception as e:
        log.error("Validate session error : " + e.message)
        return custom_error("Invalid session")
    else:
        return custom_error("Invalid session")

@check_input('GET')
def unsubscribe_from_emails(request, data, token):
    try:
        unsub_return_url = settings.SITE_URL + 'views/unsubscribed.html?subscribe='
        email = base64.b64decode(token)
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            log.error("Ubsubscribe : email:" + str(email) + " does not exist.")
            return HttpResponseRedirect(unsub_return_url + "error")
        else:
            if user and user.email and user.email != '':
                user.need_email_promotions = False
                user.save()
                return HttpResponseRedirect(unsub_return_url + "success")
            else:   
                log.error("Could not unsuscribe.", error.message)
                return HttpResponseRedirect(unsub_return_url + "error")
    except Exception as error:
        log.error("Could not unsuscribe.", error.message)
        return HttpResponseRedirect(unsub_return_url + "error")

@check_input('POST')
def send_contactus_email(request, data):
    try:
        subject = data['subject'].strip()
        message = data['message'].strip()
        if subject == '' or message == '':
            return custom_error("Please enter valid subject and message.")
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        session = ""
        if session_key :
            session = SessionStore(session_key=session_key)
        if session and 'user' in session :
            user = User.objects.get(pk=session['user']['id'])
            name = user.first_name + " " + user.last_name
            email = user.email
        else:
            name = data['name'].strip()
            email = data['email'].strip()
            if name == '':
                return custom_error("Please enter valid name.")
            elif not validate_email(email):
                return custom_error("Please enter valid email.")

        import string, random
        from libraries import mail

        dic = {
                "from_email": email,
                "name" : name,
                "subject" : subject,
                "message" : message,
                "site_url":settings.SITE_URL,
               }
        msg = render_to_string('contact_us_email_template.html', dic)
        email_sub = 'Inquiry from ' + name
        mail(['contact@meisterdish.com'], email_sub, msg, None, None, False)
    except Exception as e:
        log.error("Failed to send the contact us email : " + e.message)
        return custom_error("Failed to send the contact us email.")
    else:
        log.info("Contact us mail sent to : contact@meisterdish.com , from " + email)
        return json_response({"status":1, "message":"Email sent successfully"})   


@check_input('POST')
def get_home_meal(request, data):
    try:
        try:
            conf = Configuration.objects.get(key='home_meal_id')
            return json_response({"status":1, "meal_id":conf.value})
        except Configuration.DoesNotExist:
            return custom_error("No home meal is set.")

    except Exception as e:
        log.error("Failed to get home meal. : " + e.message)
        return custom_error("Failed to get the home meal.")

