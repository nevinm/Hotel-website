import cgi
from django.http import HttpResponse
from django.template.context import Context
from django.template.loader import get_template
import logging
import os

import cStringIO as StringIO
import settings
import xhtml2pdf.pisa as pisa


log = logging.getLogger(__name__)


def render_to_pdf(template_src, context_dict):
    '''
    Function to render html to pdf
    :param template_src:
    :param context_dict:
    '''
    try:
        template = get_template(template_src)
        context = Context(context_dict)
        html = template.render(context)
        result = StringIO.StringIO()
        pdf_css_path = os.path.join(settings.STATIC_ROOT, 'default', "pdf.css")
        pdf = pisa.pisaDocument(StringIO.StringIO(html.encode(
            "UTF-8")), dest=result, link_callback=fetch_resources,
            default_css=open(pdf_css_path, 'r').read())
        name = "print"
        if not pdf.err:
            response = HttpResponse(result.getvalue())
            response['Content-Disposition'] = 'attachment; filename=' + \
                name + '_generated.pdf'
            return response
    except Exception as error:
        return HttpResponse(error.message)


def save_to_pdf(template_src, context_dict, path):
    '''
    Function to save pdf to a file
    :param template_src:
    :param context_dict:
    :param path:
    '''
    template = get_template(template_src)
    context = Context(context_dict)
    html = template.render(context)
    result = StringIO.StringIO()
    pdf_css_path = os.path.join(settings.STATIC_ROOT, 'default', "pdf.css")
    pdf = pisa.pisaDocument(StringIO.StringIO(html.encode(
        "UTF-8")), dest=result, link_callback=fetch_resources,
        default_css=open(pdf_css_path, 'r').read())
    if not pdf.err:
        # Save PDF?
        file = open(path, 'ab+')
        file.write(result.getvalue())
        return result.getvalue()
    return False


def fetch_resources(uri, rel):
    '''
    Function to fetch resourses
    :param uri:
    :param rel:
    '''
    path = uri.replace(settings.STATIC_URL, settings.STATIC_ROOT)
    return path
