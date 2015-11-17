from __future__ import with_statement
from fabric.api import *
import requests

gvar = []

def live():
    env.hosts = ['betameisterdish@meisterdish.com']
    env.port = '6969'
    env.directory = '/home/betameisterdish/meisterdish/meisterdish_server'
    env.activate = 'source /home/betameisterdish/venv/bin/activate'
    print "Completed Live server configurations . . . "
    env.password = 'kuf6zU!E'

def qa():
    env.hosts = ['meisterdish@meisterdish.qburst.com']
    env.directory = '/home/meisterdish/public_html/meisterdish/meisterdish_server'
    env.activate = 'source /home/meisterdish/env/meisterdish/bin/activate'
    print "Completed QA server configurations . . . "
    env.password = '9XGTsh@%C8'


def migrate():
    """ Migration Process """
    path = 'public_html/meisterdish/'
    with cd(path), prefix(env.activate):
        #cd(path + 'meisterdish_server')
        run("python manage.py makemigrations && python manage.py migrate")


def require():
    """ Requirements Install Process """
    path = 'public_html/meisterdish'
    with cd(path), prefix(env.activate):
        run("pip install -r requirements.txt")


def refresh():
    run("sudo service apache2 reload")


def deploy():
    """ Deployment Process """
    path = 'public_html/meisterdish/'
    with cd(path), prefix(env.activate):
        gvar.append(run("git checkout QA_release && git pull --no-edit origin QA_release"))
        run("pip install -r requirements.txt")
        run('ls -l meisterdish_server')
        run("cd meisterdish_server && python manage.py makemigrations && python manage.py migrate")
        gvar.append(run("service apache2 reload"))
        send_success_mail()

def deployment():
    """ Deployment Process """
    path = '/home/betameisterdish/meisterdish/meisterdish_server'
    with cd(path), prefix(env.activate):
        gvar.append(run("git checkout master && git pull origin master"))
        run("pip install -r ../requirements.txt")
        run("python manage.py makemigrations && python manage.py migrate")
        gvar.append(run("sudo service apache2 reload"))


def custom():
    """ Custom Process """
    path = 'meisterdish/'
    with cd(path), prefix(env.activate):
        print ":::Enter the command to run:::"
        s = raw_input()
        run(s)


def host_type():
    run('uname -s')


def uptime():
    run('uptime')

def send_success_mail():
    html = "<html> <body><table> </table>"+\
            "<tr>  <td>   Auto deployment on QA Success  </td> </tr>" + \
            "<tr>  <td> "+ gvar[0] +" </td> </tr>" + \
            "<tr>  <td> "+ gvar[1] +" </td> </tr>" + \
            " </body> </html>"
    return requests.post(
            "https://api.mailgun.net/v3/mg.tacyonresearch.com/messages",
            auth=("api", "key-78fdfe9cece971221ca16d70b0c39bf9"),
            data={"from": "Autobuild Meisterdish QA <mailgun@mg.tacyonresearch.com>",
                "to": ["ashique@qburst.com", "thushar@qburst.com","reshmaraveendran@qburst.com"],
                "subject": "Jenkins Meisterdish Build Status",
                "html": html})

