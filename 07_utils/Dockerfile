FROM swayoleg/lamp-apache:2.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>


RUN mkdir -p /var/www/html && mkdir -p /usr/share/adminer

ADD adminer.php /usr/share/adminer/index.php

############### Other Server utils ###########
RUN apt-get install -y \
    phpmyadmin sendmail
    #&& wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

CMD ["bash", "/docker/bin/run.sh"]
