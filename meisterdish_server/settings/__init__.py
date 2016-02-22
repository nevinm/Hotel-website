import os
if os.path.dirname(__file__) == "/home/staging/settings":
    from live import *
    Live = True
else:
    from local import *
    Live = False

DEBUG = DEBUG
BASE_URL = BASE_URL
SITE_URL = SITE_URL
BASE_DIR = BASE_DIR

ADMINS = (
    ('Abdul Nasar', 'nasarp@qburst.com'),
    ('Thushar M Prakash', 'thushar@qburst.com'),
)

MANAGERS = ADMINS

ROLE_ADMIN = 1
ROLE_USER = 2
ROLE_GUEST = 3
ROLE_KITCHEN = 4
ROLE_DELIVERY = 5

ROLE_DIC = {
    ROLE_ADMIN: "Admin",
    ROLE_USER: "User",
    ROLE_GUEST: "Guest",
    ROLE_KITCHEN: "Kitchen Staff",
    ROLE_DELIVERY: "Delivery Staff",
}

ALLOWED_HOSTS = []
# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/New_York'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = BASE_URL + 'media/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Example: "http://media.lawrence.com/static/"
STATIC_URL = BASE_URL + 'static/'

STATIC_ROOT = BASE_DIR + '/static/'

EXPORT_PATH = os.path.join(MEDIA_ROOT, 'export')

# URL prefix for admin static files -- CSS, JavaScript and images.
# Make sure to use a trailing slash.
# Examples: "http://foo.com/static/admin/", "/static/admin/".
ADMIN_MEDIA_PREFIX = '/static/admin/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    #    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'a_=d43%+glrxe3am&pj$s2$nqyr9(qqnuek1y1t(h&k87gcv2o'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    #     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)
CORS_ORIGIN_ALLOW_ALL = True

CORS_ALLOW_HEADERS = (
    'x-requested-with',
    'content-type',
    'accept',
    'origin',
    'authorization',
    'x-csrftoken',
    'session-key',
    'page',
)

ROOT_URLCONF = 'meisterdish_server.urls'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or
    #     "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    BASE_DIR + "/templates",

)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'corsheaders',
    "meisterdish_server",
    'api',
    "cms",
    "mailchimp",
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'standard': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
    },
    'handlers': {
        'logfile': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': BASE_DIR + "/Log/logfile.txt",
            'maxBytes': 500000,
            'backupCount': 100,
            'formatter': 'standard',
        },
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'standard'
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'propagate': True,
            'level': 'WARN',
        },
        'django.db.backends': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': False,
        },
        'api': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'cms': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'api_user': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'model': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'libraries': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'order': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'meisterdish_server': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'xhtml2pdf': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
    }
}

PAYMENT_METHODS = (
    ('CC', 'Credit Card'),
    ('PP', 'PayPal'),
)

ORDER_STATUS = (
    (0, "Placed"),
    (1, "Packed"),
    (2, "Dispatched"),
    (3, "Delivered"),
    (4, "Cancelled"),
)


MEAL_STATUS = (
    (0, "Placed"),
    (1, "Packed"),
    (2, "Dispatched"),
    (3, "Delivered"),
    (4, "Cancelled"),
)

DEFAULT_MEAL_IMAGE = STATIC_URL + "default/meal_default.jpg"
DEFAULT_USER_IMAGE = STATIC_URL + "default/user_default.jpg"
DEFAULT_CHEF_IMAGE = STATIC_URL + "default/chef-default.png"
DEFAULT_INGREDIENTS_IMAGE = STATIC_URL + "default/ingredients-default.png"
DEFAULT_PRE_REQ_IMAGE = STATIC_URL + "default/pre-requisites-default.png"
DEFAULT_MEAL_TYPE_IMAGE = STATIC_URL + "default/mealtype_default.png"


CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}

EMAIL_IMAGES = {
    "meisterdish_logo": os.path.join(STATIC_ROOT, "default", "logo_email.png"),
}

INDIAN_NUMBERS = ["7034088806", '9961963746',
                  '9995381338', '7736194093', '8089149455', ]

PROMOCODES = {
    "MEISTER20": ("You've been invited to start cooking with $20 towards " +
                  "your first two orders. Sign up for free below to claim " +
                  "your credit."),
    "HOLIDAY50": ("You've been invited to start cooking with 50% off your " +
                  "first order. Sign up for free below."),
    "HOLIDAY20": ("You've been invited to start cooking with $20 towards " +
                  "your first two orders. Sign up for free below to claim " +
                  "your credit."),
    "FLY20": ("You've been invited to start cooking with $20 towards " +
              "your first two orders. Sign up for free below to claim " +
              "your credit."),
    "FIT20": ("You've been invited to start cooking with $20 towards " +
              "your first two orders. Sign up for free below to claim " +
              "your credit."),
    "FREE2": ("You've been invited to start cooking with $20 towards " +
              "your first two orders. Sign up for free below to claim " +
              "your credit."),
    "COOK20": ("You've been invited to start cooking with $20 towards " +
               "your first two orders. Sign up for free below to claim " +
               "your credit."),
    "MEISTER50": ("You've been invited to start cooking with 50% off your " +
                  "first order. Sign up for free below."),
    "OFFICE50": ("You've been invited to start cooking with 50% off your " +
                 "first order. Sign up for free below."),

}
