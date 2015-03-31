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

log = logging.getLogger('cms_api')


def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")


def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(messages, wrap=False):
    return json_response({'status' : -1, 'message' : messages, 'errorCode' : 200 , 'data':{'status' : -1, 'message' : messages, 'errorCode' : 200}}, wrap)


