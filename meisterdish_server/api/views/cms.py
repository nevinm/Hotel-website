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

check_input('POST')
def get_categories(request, data):
    try:
        if 'search' in data:
            search = str(data['search']).strip()
            cats = Categories.objects.filter(name__startswith=search)
        else:
            cats = Categories.objects.all()
        
        cat_list = []
        for cat in cats:
            cat_list.append({"id":cat.id, "name":cat.name})
        
        return json_response({"status":1, "message":"Category list", "categories":cat_list})
    except Exception as e:
        log.error("Failed to return category list : "+e.message)
        return json_response({"status":-1, "message":"Failed to retreive category list"})
    
def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(messages, wrap=False):
    return json_response({'status' : -1, 'message' : messages, 'errorCode' : 200 , 'data':{'status' : -1, 'message' : messages, 'errorCode' : 200}}, wrap)


