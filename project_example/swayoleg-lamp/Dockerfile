FROM swayoleg/lamp-one:1.0

############# COPY VIRTUALHOST ################

ADD olegsrv.conf /etc/apache2/sites-available/olegsrv.conf
ADD auth.json /.composer/auth.json
ADD .env /.env
RUN export $(cat /.env | xargs) && \
mkdir -p /var/www/html/$URL_ROOT_FOLDER_FROM_APP_PATH && \
sed -i "s/sitename/$VIRTUAL_HOST/g" /etc/apache2/sites-available/olegsrv.conf && \

if [ ! -z "$URL_ROOT_FOLDER_FROM_APP_PATH" ]; then sed -i "s/URL_ROOT_FOLDER_FROM_APP_PATH/$URL_ROOT_FOLDER_FROM_APP_PATH/g" /etc/apache2/sites-available/olegsrv.conf; else sed -i "s/URL_ROOT_FOLDER_FROM_APP_PATH//g" /etc/apache2/sites-available/olegsrv.conf; fi && \
cat /etc/apache2/sites-available/olegsrv.conf && \
a2ensite olegsrv.conf && \
service apache2 restart

CMD ["bash", "/docker/bin/run.sh"]