FROM swayoleg/lamp:1.0

############# COPY VIRTUALHOST ################

ADD olegsrv.conf /etc/apache2/sites-available/olegsrv.conf
ADD .env /.env
RUN export $(cat /.env | xargs) && \
sed -i "s/sitename/$VIRTUAL_HOST/g" /etc/apache2/sites-available/olegsrv.conf && \
a2ensite olegsrv.conf && \
service apache2 restart

CMD ["bash", "/docker/bin/run.sh"]