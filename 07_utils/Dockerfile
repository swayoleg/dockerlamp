FROM swayoleg/lamp-apache:2.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

RUN mkdir -p /var/www/html && mkdir -p /usr/share/adminer && mkdir /tmp/MagickWandForPHP-1.0.9

ADD utils.conf  /etc/apache2/sites-available/utils.conf
ADD adminer.php /usr/share/adminer/index.php
ADD tmp/imagick-3.4.0.tgz /tmp/
ADD tmp/ImageMagick-7.0.5-4.tar.gz /tmp/

RUN a2ensite utils.conf && \
    MWAND_EXT_FILE="/etc/php/7.0/conf.d/magickwand.ini" && \
    cd /tmp/ImageMagick-7.0.5-4 && \
    echo "Installing ImageMagick from source..." && \
    ./configure  && \
    make && \
    make install && \
    apt-get install -y libmagickwand-dev && \
    rm -rf tmp/imagick-3.4.0 tmp/ImageMagic-7.0.5-4 tmp/MagickWandForPHP-1.0.9 && \
    service apache2 restart


############### Other Server utils ###########
RUN apt-get install -y \
    phpmyadmin sendmail \
    pkg-config libmagickwand-dev && \
    cd /tmp/imagick-3.4.0 && \
    #wget https://pecl.php.net/get/imagick-3.4.0.tgz
    phpize && \
    ./configure && \
    make install && \
    rm -rf /tmp/imagick-3.4.0* && \
    echo extension=imagick.so >> /etc/php/7.0/cli/php.ini && \
    echo extension=imagick.so >> /etc/php/7.0/apache2/php.ini && \
    service apache2 restart
    #&& wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

CMD ["bash", "/docker/bin/run.sh"]
