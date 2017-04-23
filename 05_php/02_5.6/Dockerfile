FROM swayoleg/lamp-redis:1.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

########### Install basic packages############
RUN apt-get install -y \

################ PHP Packages ###############
        php5.6 php5.6-mysql php5.6-imap php5.6-dev php5.6-cli php5.6-common php5.6-mcrypt php5.6-intl php5.6-curl php5.6-bz2 php5.6-readline php5.6-json php5.6-gd php5.6-xml php5.6-zip php5.6-tidy php5.6-xmlrpc php5.6-xsl php5.6-mbstring php5.6-gettext  php5.6-mysqlnd ssl-cert   php-pear   php5.6-mcrypt php5.6-memcache php5.6-memcached php5.6-pspell php5.6-recode php5.6-sqlite php5.6-interbase php5.6-pgsql php5.6-gmp php5.6-enchant php5.6-cgi libapache2-mod-php5.6 \


CMD ["bash", "/docker/bin/run.sh"]
