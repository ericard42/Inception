FROM alpine:3.14
EXPOSE 9000

RUN apk update && apk upgrade
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl

RUN mkdir -p /var/www/html/
ADD config/latest.tar.gz /var/www/html/

COPY config/www.conf /etc/php7/php-fpm.d/www.conf
COPY config/wp-config.php /var/www/html/wordpress/wp-config.php

CMD php-fpm7 -F -R
