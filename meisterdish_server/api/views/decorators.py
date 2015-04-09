from django.http import HttpResponse, HttpResponseNotAllowed
import json as simplejson
from django.contrib.sessions.backends.db import SessionStore
from functools import wraps
import logging
from api.models import User
log = logging.getLogger('api')

def check_input(method, admin=False):
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
                                             'verify_email',]:
                        common_apis = ["get_profile"]
                        session_key = request.META.get('HTTP_SESSION_KEY', None)
                        session = SessionStore(session_key=session_key)
                        if session and 'user' in session :
                            if "user_id" in req and int(req['user_id'] != session['user']["id"]):
                                log.error('API : USER in session and request does not match. : '+req["user_id"])
                                return custom_error('You are not authorized.')
                            elif admin is True and session["user"]["role"] != 1:
                                log.error('API : User requesting admin only features.'+session["user"]["email"] +str(session["user"]["role"]))
                                return custom_error('You are not authorized.')
                            else:
                                try:
                                    user = User.objects.get(pk=session['user']['id'])
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

def json_request(request):
    if (request.method == 'GET'):
        req = request.GET
        return req
    else:
        req = request.body
        if not req:
            req='{"a":"b"}'
    if (req):
        try:
            if request.FILES:
                log.info("BODY")
                log.info(req)
                log.info("POST")
                log.info(request.POST)
                return request.POST
            else:
                return simplejson.loads(req, "ISO-8859-1")
        except Exception as e:
            log.error("Error json-decoding input : " +e.message)
            return None
    else:
        return None

def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})
