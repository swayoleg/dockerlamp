#!/bin/bash


docker rmi swayoleg/lamp:1.0 swayoleg/lamp-images:1.0 swayoleg/lamp-php:7.0 swayoleg/lamp-redis:1.0 swayoleg/lamp-db:5.7 swayoleg/lamp-base:1.0 swayoleg/lamp-apache:2.0


docker rmi $(docker images --filter "dangling=true" -q --no-trunc)