FROM swayoleg/lamp-utils:1.0

############# AUTOCLEAN ################
RUN apt-get autoremove --purge -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/* && \
    mkdir -p /docker/sockets /var/run/supervisor

CMD ["bash", "/docker/bin/run.sh"]