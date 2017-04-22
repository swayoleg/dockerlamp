#!/bin/sh

echo "Setup correct rights for socket volume"

chmod 777 /docker/sockets

echo "Run all container services"

#while true; do sleep 2; done
service apache2 restart

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
