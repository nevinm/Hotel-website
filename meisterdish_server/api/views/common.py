from django.http import HttpResponse, HttpResponseNotAllowed
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

log = logging.getLogger('api')


def home(request):
    return HttpResponse("Welcome to Meisterdish")

@check_input('POST')
def login(request, data):
    try:
        email = data['username'].strip()
        password = data['password'].strip()
        remember = data['remember'].strip()
        
        if email == '' or password == '':
            log.error("Empty email or password.")
            raise Exception("Invalid email or password")
        
        try:
            user = User.objects.get(role__id=2, email=username)
            if not user.is_active:
                return json_response({"status":-1, "message":"The user is not active. Please activate the account using the link from verification email."})

            if md5.new(password).hexdigest() == user.password:
                log.info(user.email + "logged in")
                user_dic = {"id":user.id,
                                  "email":user.email,
                                  "first_name":user.first_name,
                                  "last_name":user.last_name,
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
                log.error("Login: Invalid email/password combination : "+username)
                raise Exception("Invalid email/password combination")
        except Exception as e:
            log.error(username + " : Login  : "+str(e))
            raise Exception("An error has occurred. Please try again later.")
    except KeyError as e:
        log.error("Login : " + email + " : " + str(e) + " missing" )
        return json_response({"status":-1, "message":str(e) + " is missing."})
    except Exception as e:
        log.error("Login : " + email + " : " + str(e))
        return json_response({"status":-1, "message":e.message})

@check_input('POST')
def logout(request, data):
    if 'HTTP_SESSION_KEY' not in request.META:
        log.error("API:logout, Invalid session.")
        response = {'status': -1, "message": "Invalid session."}
    else:
        session = SessionStore(session_key=data['session_key'])
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
        mobile = data['mobile'].strip()
        
        if password == '' or first_name == '' or last_name == '' or email == '' or mobile == '':
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
            user.mobile = mobile
            user.role = Role.objects.get(pk=2)
            user.save()
            
            user_dic = {"id":user.id,
                                  "email":user.email,
                                  "first_name":user.first_name,
                                  "last_name":user.last_name,
                                  "mobile" : user.mobile,
                                  }
            
            log.info(user.email + " signed up")
            session = SessionStore()
            session["user"] = user_dic
            sessionset_expiry = settings.SESSION_EXPIRY
            session.save()
            
            log.info(email + " : Signed up ")
            if send_user_verification_mail(user):
                return json_response({"status":1, "message": "Succesfully signed up", "user":user_dic, "session_key":session.session_key})
            else:
                return json_response({"status":-1, "message": "An error has occurred in sending verification mail. Please try later.", "user":user_dic, "session_key":session.session_key})
        except Exception as e:
            log.error(email + " : Failed to sign up "+e.message)
            raise Exception("Failed to sign up. Please try again later")
    except KeyError as field:
        return json_response({"status":-1, "message":"Invalid input"})
    except Exception as e:
        return json_response({"status":-1, "message":e.message})

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
               "username" : email,
               }
        msg = render_to_string('verify_user_email_template.html', dic)
    
        mail([user.email], 'Verify you account for Meisterdish', msg )
        log.info("Sent verification mail to " + user.email)
    except Exception as e:
        log.error("Failed to send user verification mail : "+ e.message)
        return False
    return True

@check_input('GET')
def verify_user(request, data, token):
    try:
        token = token.strip()
        
        user = User.objects.get(user_verify_token=token)
        
        user.user_verify_token = ""
        user.is_active=True
        user.save()
        
        log.info("Password reset for user "+user.email)
        return HttpResponseRediredct(request.META['HTTP_HOST'] + "/login.html?verify=true")
    
    except KeyError as field:
        log.error("Reset password request missing "+field.message)
        return json_response({"status":-1, "message":"Invalid input"})
    except User.DoesNotExist:
        log.error("Reset password : No user found with given token")
        return json_response({"status":-1, "message":"Invalid token"})
    except Exception as e:
        log.error("Validate token : Exception : "+e.message)
        return json_response({"status":-1, "message":"Failed to verify user. Please try again later."})

@check_input('POST')
def forgot_password(request, data):
    try:
        email = data['email']
        
        user = User.objects.get(email=email)
        
        import string, random
        from libraries import mail
        
        token = ''.join(random.SystemRandom().choice(string.ascii_lowercase + string.digits) for _ in range(20))
        link = settings.BASE_URL + 'forgot_password/'+token+"/"
        user.password_reset_token = token
        user.save()
        
        dic = {
               "email" : email,
               "link" : link,
               "name" : user.last_name + " " + user.first_name,
               "username" : email,
               }
        msg = render_to_string('forgot_password_email_template.html', dic)

        mail([email], 'Reset your password for Meisterdish', msg )
        
    except KeyError as field:
        log.error("Forgot password request missing "+field.message)
        return json_response({"status":-1, "message":"Invalid input"})
    except User.DoesNotExist as e:
        log.error("Forgot password request with non-existing email: "+email)
        return json_response({"status":-1, "message":"No user exists with the given email address."})
    except Exception as e:
        log.error("Failed to send the password reset email : "+e.message)
        return json_response({"status":-1, "message":"Failed to send the password reset email"})
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
        return json_response({"status":-1, "message":"Invalid input"})
    except User.DoesNotExist:
        log.error("Reset password : No user found with given token")
        return json_response({"status":-1, "message":"Invalid token"})
    except Exception as e:
        log.error("Validate token : Exception : "+e.message)
        return json_response({"status":-1, "message":"Failed to reset password. Please try again later."})

@check_input('POST')
def change_password(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
        
        user_id = data['user_id'].strip()
        old_password = data['old_password'].strip()
        new_password = data['new_password'].strip()
        
        if int(user_id) != user.id:
            return json_response({"status":-1, "message":"You are not authorized."})
        
        if  md5.new(old_password).hexdigest() != user.password:
            return json_response({"status":-1, "message":"The current password you have entered is incorrect."})
        
        user.password = md5.new(new_password).hexdigest()
        user.password_reset = False
        user.save()
        
        log.info("user : " + user.email + " : changed password")
        return json_response({"status":1, "message":"Password changed successfully."})
    except Exception as e:
        log.error("user id : " + user_id + " : change password failed : "+e.message)
        return json_response({"status":-1, "message":"Failed to change the password."})

@check_input('POST')
def get_profile(request, data):
    try:
        user_id = data['user_id']
        user = User.objects.get(pk=user_id)
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

        user_data = {
                     "id" : user.id,
                     "name" : (user.last_name + " "+ user.first_name).title(),
                     "email" : user.email,
                     "mobile" : user.mobile,
                     "profile_image" : settings.MEDIA_URL + user.profile_image,
                     "is_admin" : user.is_admin,
                     "meals_in_cart" : meals,
                     "meals_in_cart_count" : len(meals),
                     "credits" : user.credits,
                     "sms_notification" : user.need_sms_notification,
                     
                     }
        return json_response(user_data)
    except KeyError as e:
        log.error("Profile request with no user_id")
        return json_response({"status":-1, "message":"Invalid input."})
    except Exception as e:
        log.error("Get profile :Exception: "+e.message)
        return json_response({"status":-1, "message":e.message})

@check_input('POST')
def edit_profile(request, data):
    try:
        user_id = data["user_id"]
        user = User.objects.get(pk=user_id)
        
        first_name = data['first_name'].strip()
        last_name = data['last_name'].strip()
        mobile = data['mobile'].strip()
        
        sms = False
        if "sms_notification" in data and data['sms_notification']=='1':
            sms = True
            
        user.first_name = first_name
        user.last_name = last_name
        user.mobile = mobile
        user.need_sms_notification = sms
        user.save()
        
        log.info("user : " + user.email + " : updated profile")
        return json_response({"status":1, "message":"Profile updated successfully."})
    except Exception as e:
        log.error("user id : " + str(user_id) + " : profile update failed : "+e.message)
        return json_response({"status":-1, "message":"Failed to update profile."})

def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(messages, wrap=False):
    return json_response({'status' : -1, 'message' : messages, 'errorCode' : 200 , 'data':{'status' : -1, 'message' : messages, 'errorCode' : 200}}, wrap)

