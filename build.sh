#!/bin/bash
# you can rebuild your stack without cache
CACHE="--no-cache"
#CACHE=""

# CORE IMAGE LAYER
#docker build ${CACHE} -t swayoleg/lamp-base:1.0     01_base

# LIBS IMAGE LAYER with  images support
docker build ${CACHE} -t swayoleg/lamp-images:1.0   02_libs/01_images

# SERVICES IMAGE LAYER
docker build ${CACHE} -t swayoleg/lamp-redis:1.0    03_services/01_redis

# PHP IMAGE LAYER
docker build ${CACHE} -t swayoleg/lamp-php:7.0      05_php/03_7.0

# SERVER image layer
docker build ${CACHE} -t swayoleg/lamp-apache:2.0   06_server/01_apache2

#DATABASE
docker build ${CACHE} -t swayoleg/lamp-db:5.7       04_database/01_mysql


# FINAL LAMP
docker build ${CACHE} -t swayoleg/lamp:1.0  ./

