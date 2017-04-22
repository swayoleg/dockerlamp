FROM swayoleg/lamp-php:7.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

########### ENVIRONMENT ###########
ENV DEBIAN_FRONTEND=noninteractive \
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_PID_FILE=/var/run/apache2.pid

############## APACHE #########################
RUN apt-get install -y apache2 apache2-doc apache2-utils && \
    mkdir -p /var/www/html/adminer && \
    wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php && \

    echo "AddDefaultCharset UTF-8" >>  /etc/apache2/apache2.conf && \
    echo "ServerName 127.0.0.1" >>  /etc/apache2/apache2.conf && \
    echo "HostnameLookups Off" >>  /etc/apache2/apache2.conf && \
    service apache2 restart

ADD bin /docker/bin

CMD ["bash", "/docker/bin/run.sh"]
