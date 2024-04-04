#!/bin/bash

echo "Starting wordpress.sh"
mkdir -p /run/php/
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "Starting php-fpm"
	exec "$@";
	exit 0;
fi

if [ ! -d "/usr/local/bin/wp/" ]; then
	echo "Installing wp-cli ..."
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/html/wordpress" ]; then
	echo "Creating wordpress directory"
    mkdir -p /var/www/html/wordpress
fi

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create	--allow-root \
					--dbname=$DATABASE_NAME \
					--dbuser=$DATABASE_USER \
					--dbpass=$DATABASE_USER_PASSWORD \
					--dbhost=mariadb\
					--path='/var/www/html/wordpress/' \
					--skip-check

wp core install		--allow-root \
					--url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_USER \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL

wp user create	--allow-root \
				$WORDPRESS_SUB_USER \
				$WORDPRESS_SUB_EMAIL \
				--role=author \
				--user_pass=$WORDPRESS_SUB_PASSWORD

echo "Starting php-fpm ..."
exec $@