from django.http import HttpResponse, HttpResponseNotAllowed
import json as simplejson
from django.contrib.sessions.backends.db import SessionStore
from functools import wraps
import logging
log = logging.getLogger('api')

def check_input(method, admin=False):
    def wrapper(func):
        def inner_decorator(request, *args, **kwargs):
            if request.method.upper() == method.upper():
                req = json_request(request)
                if req is not None:
                    log.info('API : '+func.__name__+', Input: '+str(req))
                    if func.__name__ not in ['login','signup', 'forgot_password', 'logout', 'reset_password', 'verify_user']:
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
                                return func(request, req, *args, **kwargs)
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
            return simplejson.loads(req, "ISO-8859-1")
        except Exception as name:
            try:
                return simplejson.loads(unicode(opener.open(request), "ISO-8859-1"))
            except:
                return None
            return None
    else:
        return None


def json_response(message):
    return HttpResponse(simplejson.dumps(message), content_type="application/json")

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})
