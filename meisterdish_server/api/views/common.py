from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from api.models import *
import json as simplejson
import md5
import logging 
import settings
from datetime import datetime
from django.db.models import Q
from django.template.loader import render_to_string
from decorators import *
import sys, traceback

log = logging.getLogger('api')

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
                user = User.objects.get(email=email, role__id=1)
            else:
                user = User.objects.get(email=email, role__id=2)
                
            if md5.new(password).hexdigest() == user.password:
                valid = True
            else:
                return custom_error("Invalid email or password.")
                
        else:
            try:
                fb_id = data["fb_id"].strip()
                user = User.objects.get(fb_user_id=fb_id, email=email)
            except:
                return custom_error("No user found with the given details")
            else:
                valid = True
            remember = 0
        
        if valid:
            if not user.is_active:
                return json_response({"status":-1, "message":"The user is not active. Please activate the account using the link from verification email."})
            log.info(user.email + "logged in")
            
                
            user_dic = {"id":user.id,
                              "email":user.email,
                              "first_name":user.first_name,
                              "last_name":user.last_name,
                              "role" : user.role.id,
                              }
            
            session = SessionStore()
            session["user"] = user_dic
            if str(remember) == "1":
                session.set_expiry = 0
            else:
                session.set_expiry = settings.SESSION_EXPIRY
            session.save()
            log.info(email+" logged in ..")
            return json_response({"status":1, "message": "Logged in succesfully", "user":user_dic, "session_key":session.session_key})
        else:
            log.error("Login failed")
            raise Exception("Login failed")
    
    except KeyError as e:
        log.error("Login :" + str(e) + " missing" )
        return json_response({"status":-1, "message":"Please fill all the fields."})
    except Exception as e:
        log.error("Login : " + e.message)
        return json_response({"status":-1, "message": "Login failed. Please try again later."})

@check_input('POST')
def logout(request, data):
    if 'HTTP_SESSION_KEY' not in request.META:
        log.error("API:logout, Invalid session.")
        response = {'status': -1, "message": "Invalid session."}
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
        email = data['email'].strip()
        first_name = data['first_name'].strip()
        last_name = data['last_name'].strip()
        
        fb = False
        fb_id = ""
        if 'fb_id' in data:
            fb_id = data['fb_id']
            fb = True
            
        if password == '' or first_name == '' or last_name == '' or email == '':
            log.error(email + " : Sign up failed. Fill required fields.")
            raise Exception("Please fill in all the required fields")
        
        if User.objects.filter(email=email).exists():
            raise Exception("email already exists")
        try:
            user = User()
            user.email = email
            user.password = md5.new(password).hexdigest()
            user.first_name = first_name
            user.last_name = last_name
            user.role = Role.objects.get(pk=2)
            user.fb_user_id = fb_id
            user.save()
            
            user_dic = {"id":user.id,
                                  "email":user.email,
                                  "first_name":user.first_name,
                                  "last_name":user.last_name,
                                  "role":user.role.id,
                                  }
            
            log.info(user.email + " signed up")
            session = SessionStore()
            session["user"] = user_dic
            sessionset_expiry = settings.SESSION_EXPIRY
            session.save()
            
            log.info(email + " : Signed up ")
            if send_user_verification_mail(user):
                log.info("Sent verification mail to " + user.email)
                return json_response({"status":1, "message": "A verification email has been sent to you email ("+email+"). Please follow the link in verification email to activate your account.", "user":user_dic, "session_key":session.session_key})
            else:
                log.error("Failed to send user verification mail : ")
                return custom_error("An error has occurred in sending verification mail. Please try later.")
        except Exception as e:
            log.error(email + " : Failed to sign up "+e.message)
            raise Exception("Failed to sign up. Please try again later")
    except KeyError as field:
        log.error("failed to signup "+str(field) + "missing")
        return custom_error("Invalid input")
    except Exception as e:
        log.error("failed to signup "+e.message)
        return custom_error(e.message)

def send_user_verification_mail(user):
    try:
        import string, random
        from libraries import mail
    
        token = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        link = settings.BASE_URL + 'verify_user/'+token+"/"
        user.user_verify_token = token
        user.save()
        
        dic = {
               "email" : user.email,
               "link" : link,
               "name" : user.last_name + " " + user.first_name,
               "username" : user.email,
               }
        msg = render_to_string('verify_user_email_template.html', dic)
    
        mail([user.email], 'Verify your account for Meisterdish', msg )
        log.info("Sent verification mail to " + user.email)
    except Exception as e:
        log.error("Failed to send user verification mail : "+ e.message)
        return False
    return True

@check_input('GET')
def verify_user(request, data, token):
    login_url = settings.SITE_URL + "views/login.html"
    try:
        token = token.strip()
        
        user = User.objects.get(user_verify_token=token)
        
        user.user_verify_token = ""
        user.is_active=True
        user.save()
        
        log.info("Verified user "+user.email)
        return HttpResponseRedirect(login_url+"?verify=true")
    
    except KeyError as field:
        log.error("verify request request missing "+field.message)
        return HttpResponseRedirect(login_url+"?verify=false")

    except User.DoesNotExist:
        log.error("Verify : No user found with given token")
        return HttpResponseRedirect(login_url+"?verify=false")

    except Exception as e:
        log.error("Validate token : Exception : "+e.message)
        return HttpResponseRedirect(login_url+"?verify=false")

@check_input('POST')
def forgot_password(request, data):
    try:
        email = data['email'].strip()
        
        user = User.objects.get(email=email)
        
        import string, random
        from libraries import mail
        
        token = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        #link = settings.BASE_URL + 'password_reset_return/'+token+"/"
        link = settings.SITE_URL+"views/reset_password.html?token="+token
        user.password_reset_token = token
        user.save()
        
        dic = {
               "email" : email,
               "link" : link,
               "name" : user.last_name + " " + user.first_name,
               "username" : user.email,
               }
        msg = render_to_string('forgot_password_email_template.html', dic)

        mail([email], 'Reset your password for Meisterdish', msg )
        
    except KeyError as field:
        log.error("Forgot password request missing "+field.message)
        return custom_error("Invalid input")
    except User.DoesNotExist as e:
        log.error("Forgot password request with non-existing email: "+email)
        return custom_error("No user exists with the given email address.")
    except Exception as e:
        log.error("Failed to send the password reset email : "+e.message)
        return custom_error("Failed to send the password reset email")
    else:
        log.info("Reset password mail sent to : "+email)
        return json_response({"status":1, "message":"Password reset link has been sent to "+user.email})

@check_input('POST')
def reset_password(request, data):
    try:
        token = data['token'].strip()
        new_password = data['password'].strip()
        user = User.objects.get(password_reset_token=token)
        
        user.password_reset_token = ""
        user.password = md5.new(new_password).hexdigest()
        user.save()
        
        log.info("Password reset for user "+user.email)
        return json_response({"status":1, "message":"Password has been reset."})
    
    except KeyError as field:
        log.error("Reset password request missing "+field.message)
        return custom_error("Invalid input")
    except User.DoesNotExist:
        log.error("Reset password : No user found with given token")
        return custom_error("Invalid token")
    except Exception as e:
        log.error("Validate token : Exception : "+e.message)
        return custom_error("Failed to reset password. Please try again later.")

@check_input('POST')
def change_password(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
        
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
        log.error( "Change password failed : "+e.message)
        return custom_error("Failed to change the password.")

@check_input('POST')
def get_profile(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
        
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
                              'image_url':meal.image_url,
                              })
        address_list = []
        addresses = Address.objects.filter(user=user)
        for add in addresses:
            address_list.append({
                                 "id":add.id,
                                 "name":add.name,
                                 "is_primary":1 if add.is_primary else 0,
                                 "street":add.street,
                                 "building":add.building,
                                 "city":add.city.name,
                                 "state":add.city.state.name,
                                 "zip":add.zip,
                                 "phone":add.phone,
                                 })
            
        user_data = {
                     "status":1,
                     "id" : user.id,
                     "name" : (user.last_name + " "+ user.first_name).title(),
                     "email" : user.email,
                     "mobile" : user.mobile,
                     "profile_image" : settings.MEDIA_URL + str(user.profile_image),
                     "is_admin":True if user.role.id == 1 else False,
                     "meals_in_cart" : meals,
                     "meals_in_cart_count" : len(meals),
                     "credits" : user.credits,
                     "sms_notification" : user.need_sms_notification,
                     "address_list" : address_list,
                     "first_name" : user.first_name.title(),
                     "last_name" : user.last_name.title(),
                     }
        return json_response(user_data)
    except KeyError as e:
        log.error("Profile request with no user_id")
        return custom_error("Invalid input.")
    except Exception as e:
        log.error("Get profile :Exception: "+e.message + traceback.tb_lineno(sys.exc_info()[2]))
        return custom_error("Failed to retrieve profile details.")

@check_input('POST')
def edit_profile(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
        
        if 'first_name' in data:
            user.first_name = data['first_name'].strip()
        
        if 'last_name' in data:    
            user.last_name = data['last_name'].strip()
        
        if 'mobile' in data:
            user.mobile = data['mobile'].strip()
        
        sms = False
        if "sms_notification" in data and data['sms_notification']=='1':
            sms = True
        
        user.need_sms_notification = sms
        user.save()
        
        log.info("user : " + user.email + " : updated profile")
        return json_response({"status":1, "message":"Profile updated successfully."})
    except Exception as e:
        log.error("user id : " + str(user_id) + " : profile update failed : "+e.message)
        return custom_error("Failed to update profile.")

@check_input('POST')
def get_cities(request, data):
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
def get_states(request, data):
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
def change_email(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
        
        email = data["email"].strip()
        
        if user.email == email:
            raise Exception("Please enter a different email.")
        elif User.objects.filter(email=email).exists():
            raise Exception("Email already exists for another user.")
        else:
            user.email = email
            user.save()
            return json_response({"status":1, "message":"Updated email address"})
    except Exception as e:
        log.error("Failed to change email : " + e.message)
        return custom_error("Failed to change email.")
    
def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})

