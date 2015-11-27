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
            "<tr>  <td> "+"<pre>" + gvar[0]+" <pre>"+" </td> </tr>" + \
            "<tr>  <td> "+ gvar[1] +" </td> </tr>" + \
            " </body> </html>"

    import smtplib
    import datetime
    from email.mime.multipart import MIMEMultipart
    from email.mime.text import MIMEText



    sender = 'calicutjenkins@gmail.com'
    receivers = ['thushar@qburst.com']
    
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Meisterdish Autodeployment QA Success!"
    msg['From'] = sender
    msg['To'] = receivers

    text = "Meisterdish Autodeploymet of the QA Server is a success\n Deployed on "+ str(datetime.datetime.now())
    # Html mail with Plain text alternate file
    part1 = MIMEText(text, 'plain')
    part2 = MIMEText(html, 'html')

    # Attach parts into message container.
    # According to RFC 2046, the last part of a multipart message, in this case
    # the HTML message, is best and preferred.
    msg.attach(part1)
    msg.attach(part2)



    try:
        username = 'calicutjenkins@gmail.com'
        password = 'calicut.jenkins'
        server = smtplib.SMTP('smtp.gmail.com:587')
        server.starttls()
        server.login(username,password)
        server.sendmail(sender, receivers, msg.as_string())
        server.quit()
        print "Successfully sent email"
    except smtplib.SMTPException:
        print "Error: unable to send email"



