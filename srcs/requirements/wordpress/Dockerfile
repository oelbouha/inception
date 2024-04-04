
FROM debian:buster

RUN apt -y update && apt -y upgrade
RUN apt install -y  wget \
                    php-fpm \
                    php-mysql \
                   mariadb-client 

# Install wp-cli to manage wordpress from the command line
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
        && chmod +x /usr/local/bin/wp


COPY ./tools/wordpress.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

# Start php-fpm in the foreground to keep the container running 
CMD ["php-fpm7.3", "-F"]