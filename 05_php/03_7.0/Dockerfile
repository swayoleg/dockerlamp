FROM swayoleg/lamp-redis:1.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

################ PHP Packages ###############
RUN apt-get install -y \
    php7.0 php7.0-mysql php7.0-imap php7.0-dev php7.0-cli php7.0-common php7.0-mcrypt php7.0-intl php7.0-curl php7.0-bz2 php7.0-readline php7.0-json php7.0-gd php7.0-xml php7.0-zip php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php7.0-gettext  php7.0-mysqlnd ssl-cert   php-pear   php7.0-mcrypt php7.0-memcache php7.0-memcached php7.0-pspell php7.0-recode php7.0-sqlite php7.0-interbase php7.0-pgsql php7.0-gmp php7.0-enchant php7.0-cgi libapache2-mod-php7.0 php7.0-gettext php7.0-imagick  && \
  # COMPOSER INSTALL
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

CMD ["bash", "/docker/bin/run.sh"]
