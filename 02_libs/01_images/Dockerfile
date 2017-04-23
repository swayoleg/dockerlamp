FROM swayoleg/lamp-base:1.0

MAINTAINER Ovsianikov Oleg<swayoleg@gmail.com>

# except wget
ADD jpegsrc.v8c.tar.gz /usr/local/src/

############ IMAGES SUPPORT ###########
RUN apt-get install -y -f  libjpeg-dev libpng-dev libfreetype6 libfreetype6-dev zlib1g-dev && \
    apt-get install -y optipng pngcrush  jpegoptim imagemagick libmagickwand-dev  && \
    ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib && \
    ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib && \
    ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib && \

    #wget http://www.ijg.org/files/jpegsrc.v8c.tar.gz -O /usr/local/src/jpegsrc.v8c.tar.gz && \
    cd /usr/local/src/ && \
    #tar xvfz /usr/local/src/jpegsrc.v8c.tar.gz && \
    cd jpeg-8c && \
    ./configure --enable-shared --prefix=$CONFIGURE_PREFIX && \
    make && \
    make install && \
    echo "jpeg installed" && \
    apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev

CMD ["bash", "/docker/bin/run.sh"]
