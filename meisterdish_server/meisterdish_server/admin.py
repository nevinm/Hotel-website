from django.contrib import admin
from django.db.models import get_models, get_app

from meisterdish_server.models import *


for model in get_models(get_app('meisterdish_server')):
    admin.site.register(model)
