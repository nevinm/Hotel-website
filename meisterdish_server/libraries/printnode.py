import settings
import urllib, urllib2, base64, json
import logging
log = logging.getLogger(__name__)

url = settings.PRINTNODE_API_URL
username = settings.PRINTNODE_USERNAME
password = settings.PRINTNODE_PASSWORD
def api_call(section, data=None):
    try:
        request = urllib2.Request(url+"/"+section)
        base64string = base64.encodestring('%s:%s' % (username, password)).replace('\n', '')
        request.add_header("Authorization", "Basic %s" % base64string)   
        if data:
            request.data = json.dumps(data)
            request.add_header('Content-Type', 'application/json')
        result = urllib2.urlopen(request)
        return  json.loads(result.read())
    except Exception as e:
        log.error("Failed to print : "+e.message)
        return None
