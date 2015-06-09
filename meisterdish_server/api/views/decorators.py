from django.http import HttpResponse
from django.contrib.sessions.backends.db import SessionStore
from functools import wraps
import logging, settings
from libraries import json_request, json_response, custom_error
from meisterdish_server.models import User
log = logging.getLogger('api')

def check_input(method):
    def wrapper(func):
        def inner_decorator(request, *args, **kwargs):
            if request.method.upper() == method.upper():
                req = json_request(request)
                if req is not None:
                    log.info('API : '+func.__name__+', Input: '+str(req))
                    if func.__name__ not in ['login',
                                             'signup', 
                                             'forgot_password', 
                                             'logout', 
                                             'reset_password', 
                                             'verify_user', 
                                             'verify_email',
                                             'get_meals',
                                             "get_categories",
                                             "get_meal_details",
                                             "add_to_cart",
                                             "check_delivery",
                                             ]:

                        session_key = request.META.get('HTTP_SESSION_KEY', None)
                        session = SessionStore(session_key=session_key)
                        if session and 'user' in session :
                            if "user_id" in req and int(req['user_id'] != session['user']["id"]):
                                log.error('API : USER in session and request does not match. : '+req["user_id"])
                                return custom_error('You are not authorized.')
                            else:
                                try:
                                    user = User.objects.get(pk=session['user']['id'], role__pk=settings.ROLE_USER)
                                except Exception as e:
                                    log.error("No user in session !!" + str(session['user']['id']))
                                    return custom_error("This user is no more available. Please login again.")
                                return func(request, req, user, *args, **kwargs)
                        else:
                            message = 'The session is invalid. Please login again.'
                            log.error('API : '+func.__name__+', Invalid session:Rejected')
                            return json_response({'status' : '-1', 'message' : message})
                    else:
                        return func(request, req, *args, **kwargs)   
                else:
                    log.error('API : Got a request with non-JSON input, Rejected.')
                    return custom_error('Please enter a valid JSON input')
            else:
                log.error('API : Got a '+method.upper()+' request, Rejected.')
                return custom_error('The Requested method is not allowed')
        return wraps(func)(inner_decorator)
    return wrapper