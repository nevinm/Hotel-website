from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotAllowed
import json as simplejson
from django.contrib.sessions.backends.db import SessionStore
from functools import wraps
import logging
from meisterdish_server.models import User
import settings
from libraries import json_request, json_response, custom_error
log = logging.getLogger('cms')

def check_input(method, role=False): # Allow all users by default
    def wrapper(func):
        def inner_decorator(request, *args, **kwargs):
            if request.method.upper() == method.upper():
                req = json_request(request)
                if req is not None:
                    log.info('API : '+func.__name__+', Input: '+str(req))
                    if func.__name__ not in ['login',
                                             'logout',
                                             ]:
                        
                        session_key = request.META.get('HTTP_SESSION_KEY', None)
                        session = SessionStore(session_key=session_key)
                        if session and 'user' in session :
                            if "user_id" in req and int(req['user_id'] != session['user']["id"]):
                                log.error('API : USER in session and request does not match. : '+req["user_id"])
                                return custom_error('You are not authorized.')
                            elif role and session["user"]["role"] != role:
                                log.error('API : User requesting role('+str(role)+') only features.'+session["user"]["email"] +str(session["user"]["role"]))
                                return custom_error('You are not authorized.')
                            else:
                                try:
                                    if not role:
                                        user = User.objects.get(pk=session['user']['id'])
                                    else:
                                        user = User.objects.get(pk=session['user']['id'], role__pk=role)
                                except Exception as e:
                                    log.error("No user in session !!" + str(session['user']['id']))
                                    return custom_error("You are not authorized to make this request.")
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