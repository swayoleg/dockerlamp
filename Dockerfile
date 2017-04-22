FROM swayoleg/lamp-apache:2.0

############# AUTOCLEAN ################
RUN apt-get autoremove --purge -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -r /var/lib/apt/lists/* && \
    mkdir -p /docker/sockets /var/run/supervisor

# Expose Ports
EXPOSE 80 443 9001 3306

CMD ["bash", "/docker/bin/run.sh"]