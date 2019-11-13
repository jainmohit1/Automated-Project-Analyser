FROM ubuntu:16.04

MAINTAINER Abhishek Pareek "abhishekpareek29@gmail.com"

EXPOSE 80

RUN apt-get update
RUN apt-get -y install apache2
RUN apt-get -y install apache2-dev
RUN apt-get -y install vim
RUN apt-get -y install libapache2-mod-wsgi-py3
RUN apt-get -y install mysql-client
RUN apt-get -y install cron

# Add crontab
ADD crontab /etc/cron.d/trigger-csc-se
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/trigger-csc-se
# Apply cron job
RUN crontab /etc/cron.d/trigger-csc-se

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN pip install uwsgi
RUN pip install flask
RUN pip install flask-restful
RUN pip install Flask-API
RUN pip install Flask-Cors
RUN pip install flask-mysql
RUN pip install mod_wsgi
RUN pip install pylint
RUN pip install mysql-connector-python-rf
RUN pip install requests
RUN pip install WTForms

# Load apache cgi module
RUN a2enmod cgi
RUN a2enmod wsgi
RUN service apache2 restart

# Copy over the apache configuration file and enable the site
COPY ./csc-se.conf /etc/apache2/sites-available/csc-se.conf
RUN a2ensite csc-se.conf
RUN a2enmod headers


RUN chmod -R u+rwx,g+x,o+x /var/www/html

RUN ln -sf /usr/bin/python /usr/local/bin/python

CMD /usr/sbin/apache2ctl -D FOREGROUND && CMD cron -f
