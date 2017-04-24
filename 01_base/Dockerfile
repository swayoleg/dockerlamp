FROM ubuntu:16.10

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

########### ENVIRONMENT ###########
ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

########### Install basic packages############
RUN apt-key update && \
    apt-get update && \
    apt-get install -y \
        apt-utils && \
    apt-get install -y \
        iputils-ping \
        gcc \
        re2c \
        git \
        git-core \
        locales-all \
        supervisor \
        bash-completion \
        hostname \
        vim \
        nano \
        wget \
        htop \
        curl \
        sed \
        ssh \
        #openssh-server \
        python \
        build-essential \
        software-properties-common \
        python3-software-properties \

############## LANG AND LOCALE ###############
        language-pack-en-base \
        language-pack-cs-base && \
    dpkg-reconfigure locales && \
    locale-gen cs_CZ.UTF-8 && \
    locale-gen ru_RU.UTF-8 && \
    /usr/sbin/update-locale LANG=cs_CZ.UTF-8 && \
    /usr/sbin/update-locale LANG=ru_RU.UTF-8


ADD bin /docker/bin

# Supervisor Config
ADD configs/supervisord.conf /etc/supervisord.conf
ADD configs/supervisor/* /etc/supervisor/conf.d/

COPY configs/home/* /root/

CMD ["bash", "/docker/bin/run.sh"]
