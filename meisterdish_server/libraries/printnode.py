import base64
import json
import logging
import urllib
import urllib2

import settings


log = logging.getLogger(__name__)

url = settings.PRINTNODE_API_URL
username = settings.PRINTNODE_USERNAME
password = settings.PRINTNODE_PASSWORD


def api_call(section, data=None):
    '''
    Function to call print node api
    :param section:
    :param data:
    '''
    try:
        request = urllib2.Request(url + "/" + section)
        base64string = base64.encodestring(
            '%s:%s' % (username, password)).replace('\n', '')
        request.add_header("Authorization", "Basic %s" % base64string)
        if data:
            request.data = json.dumps(data)
            request.add_header('Content-Type', 'application/json')
        result = urllib2.urlopen(request)
        return json.loads(result.read())
    except Exception as error:
        log.error("Failed to print : " + error.message)
        return None
