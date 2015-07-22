from django.template.loader import get_template
from django.template.context import Context
from django.http import HttpResponse
from django.conf import settings
import xhtml2pdf.pisa as pisa
import cStringIO as StringIO
import cgi
import os

import logging
log = logging.getLogger(__name__)

def render_to_pdf( template_src, context_dict):
    try:
        template = get_template(template_src)
        context = Context(context_dict)
        html  = template.render(context)
        result = StringIO.StringIO()
        
        pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("UTF-8")), dest=result, link_callback=fetch_resources)
        name = "print"
        if not pdf.err:
            response = HttpResponse(result.getvalue())
            response['Content-Disposition'] = 'attachment; filename='+name+'_generated.pdf'
            return response
    except Exception as e:
        return HttpResponse(e.message)

def save_to_pdf( template_src, context_dict, path):
    template = get_template(template_src)
    context = Context(context_dict)
    html  = template.render(context)
    result = StringIO.StringIO()

    pdf = pisa.pisaDocument(StringIO.StringIO(html.encode("UTF-8")), dest=result, link_callback=fetch_resources)
    if not pdf.err:
        file = open (path, 'ab')
        file.write(result.getvalue())
        return True
    return False


def fetch_resources(uri, rel):
    path = uri.replace(settings.STATIC_URL, settings.ROOT+'static/')
    return path

