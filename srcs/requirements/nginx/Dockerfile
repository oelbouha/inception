# Use Debian Buster as the base image

FROM debian:buster

RUN apt -y update && apt -y upgrade
RUN apt install -y 	nginx \
			openssl 

RUN mkdir -p /var/www/html/wordpress

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/nginx.sh /usr/local/bin/

RUN chmod 755 -R /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

RUN chmod 755 /usr/local/bin/nginx.sh && chmod 644 /etc/nginx/conf.d/default.conf

CMD ["/usr/local/bin/nginx.sh"]