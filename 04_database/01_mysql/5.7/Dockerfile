FROM mysql/mysql-server:5.7

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

########### ENVIRONMENT ###########
ENV DEBIAN_FRONTEND=noninteractive \
    MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    MYSQL_ROOT_HOST=% \
    TERM=xterm

ADD configs/devmode.cnf /etc/mysql/conf.d/devmode.cnf
ADD configs/devmode.cnf /etc/my.cnf


EXPOSE 3306
