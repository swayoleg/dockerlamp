FROM swayoleg/lamp-redis:1.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

########### Install basic packages############
RUN apt-get install -y \

################ PHP Packages ###############
        php5.5 php5.5-mysql php5.5-imap php5.5-dev php5.5-cli php5.5-common php5.5-mcrypt php5.5-intl php5.5-curl php5.5-bz2 php5.5-readline php5.5-json php5.5-gd php5.5-xml php5.5-zip php5.5-tidy php5.5-xmlrpc php5.5-xsl php5.5-mbstring php5.5-gettext  php5.5-mysqlnd ssl-cert   php-pear   php5.5-mcrypt php5.5-memcache php5.5-memcached php5.5-pspell php5.5-recode php5.5-sqlite php5.5-interbase php5.5-pgsql php5.5-gmp php5.5-enchant php5.5-cgi libapache2-mod-php5.5 && \
  # COMPOSER INSTALL
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

CMD ["bash", "/docker/bin/run.sh"]
