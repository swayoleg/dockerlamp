FROM swayoleg/lamp-images:1.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

############ REDIS ###############
RUN apt-get install -y redis-server && \
    mkdir -p /var/lib/redis /var/lib/redis_sess && \
    chown redis:redis /var/lib/redis /var/lib/redis_sess && \
    # setup redis component
    update-rc.d -f redis-server disable && \
    sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(databases .*\)$/databases 4/' /etc/redis/redis.conf && \
    sed -i 's/^#\?\s*\(unixsocket .*\)$/unixsocket \/docker\/sockets\/redis.sock/' /etc/redis/redis.conf && \
    sed -i 's/^#\?\s*\(unixsocketperm .*\)$/unixsocketperm 777/' /etc/redis/redis.conf && \
    # setup 2nd redis
    cp -p /etc/redis/redis.conf /etc/redis/redis_sess.conf && \
    sed -i 's/^\(port .*\)$/port 6380/' /etc/redis/redis_sess.conf && \
    sed -i 's/^\(dir .*\)$/dir \/var\/lib\/redis_sess/' /etc/redis/redis_sess.conf && \
    sed -i 's/^\(pidfile .*\)$/pidfile \/var\/run\/redis\/redis-sess.pid/' /etc/redis/redis_sess.conf && \
    sed -i 's/^\(logfile .*\)$/logfile \/var\/log\/redis\/redis-sess.log/' /etc/redis/redis_sess.conf && \
    sed -i 's/^#\?\s*\(unixsocket .*\)$/unixsocket \/docker\/sockets\/redis_sess.sock/' /etc/redis/redis_sess.conf

ADD configs/supervisor/* /etc/supervisor/conf.d/

CMD ["bash", "/docker/bin/run.sh"]
