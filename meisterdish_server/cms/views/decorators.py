"""
CMS View decorators
"""

from django.contrib.sessions.backends.db import SessionStore
from functools import wraps
import logging

from libraries import nvp_request, json_request, custom_error
from meisterdish_server.models import User


log = logging.getLogger(__name__)


def check_input(method, role=False):
    '''
    Decorator to check admin role and input method
    Allow all users by default
    :param method:
    :param role:
    '''
    def wrapper(func):
        def inner_decorator(request, *args, **kwargs):
            if request.method.upper() == method.upper():
                if func.__name__ in ['export_users',
                                     'export_orders',
                                     'export_users_for_promotion',
                                     'export_zips_unsupported',
                                     'export_kitchen_orders']:
                    req = nvp_request(request)
                else:
                    req = json_request(request)
                if req is not None:
                    log.info('API : ' + func.__name__ + ', Input: ' + str(req))
                    if func.__name__ not in ['login',
                                             'logout',
                                             'import_meals',
                                             'export_users',
                                             'export_orders',
                                             'export_users_for_promotion',
                                             'export_zips_unsupported',
                                             'export_kitchen_orders'
                                             ]:

                        session_key = request.META.get(
                            'HTTP_SESSION_KEY', None)
                        session = SessionStore(session_key=session_key)
                        if session and 'user' in session:
                            if role and session["user"]["role"] != role:
                                log.error(
                                    'API : User requesting role(' + str(role) +
                                    ') only features.' + session["user"][
                                        "email"] + str(session["user"]["role"])
                                )
                                return custom_error(
                                    'You are not authorized.', -2)
                            else:
                                try:
                                    if not role:
                                        user = User.objects.get(
                                            pk=session['user']['id'])
                                    else:
                                        user = User.objects.get(
                                            pk=session['user']['id'],
                                            role__pk=role)
                                except Exception:
                                    log.error(
                                        "No user in session !!" + str(
                                            session['user']['id']))
                                    return custom_error(
                                        "You are not authorized to make this \
                                            request.")
                                return func(
                                    request, req, user, *args, **kwargs)
                        else:
                            message = 'The session is invalid. \
                                Please login again.'
                            log.error(
                                'API : ' + func.__name__ +
                                ', Invalid session:Rejected')
                            return custom_error(message, -2)
                    else:
                        return func(request, req, *args, **kwargs)
                else:
                    log.error(
                        'API : Got a request with non-JSON input, Rejected.')
                    return custom_error('Please enter a valid JSON input')
            else:
                log.error(
                    'API : Got a ' + request.method.upper() + ' request, Rejected.')
                return custom_error('The Requested method is not allowed')
        return wraps(func)(inner_decorator)
    return wrapper
