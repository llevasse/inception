sleep 10
wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_ROOT_PW --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install	--path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$SQL_ROOT --admin_password=$SQL_ROOT_PW --admin_email=$SQL_ROOT_MAIL

wp user create --path="/var/www/html/wordpress" --allow-root $SQL_USER $SQL_USER_MAIL --user_pass=$SQL_USER_PW

mkdir -p /run/php
php-fpm7.3 -F
php-fpm8.2 -F
