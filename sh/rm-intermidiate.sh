#!/usr/bin/env bash

# CLEANUP INTERMIDIATE IMAGES
docker rmi swayoleg/lamp-base:1.0 swayoleg/lamp-images:1.0 swayoleg/lamp-redis:1.0 swayoleg/lamp-php:7.0 swayoleg/lamp-apache:2.0 swayoleg/lamp-utils:1.0
