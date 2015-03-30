import os, sys, site

VIRTUAL_ENV_PATH = ['/home/meisterdish/env/meisterdish/lib/python2.7/site-packages']
prev_sys_path = list(sys.path)
# Add each new site-packages directory.
for directory in VIRTUAL_ENV_PATH:
  site.addsitedir(directory)

# Reorder sys.path so new directories at the front.
new_sys_path = []
for item in list(sys.path):
    if item not in prev_sys_path:
        new_sys_path.append(item)
        sys.path.remove(item)
sys.path[:0] = new_sys_path


path = '/home/meisterdish/public_html/meisterdish/meisterdish_server/'
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
#application = django.core.handlers.wsgi.WSGIHandler()
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
