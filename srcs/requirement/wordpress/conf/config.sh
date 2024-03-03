printf "Lunch config.sh (sleep 1)\n"

sleep 1 
printf "Lunch config.sh\n"
wp core download --path=/var/www/html/wordpress --allow-root

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/${SQL_DATABASE}/" var/www/html/wordpress/wp-config.php
sed -i "s/username_here/${SQL_USER}/" var/www/html/wordpress/wp-config.php
sed -i "s/password_here/${SQL_USER_PW}/" var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" var/www/html/wordpress/wp-config.php

#	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_ROOT --dbpass=$SQL_USER_PW --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

wp core install	--path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$SQL_ROOT --admin_password=$SQL_ROOT_PW --admin_email=$SQL_ROOT_MAIL

wp user create --path="/var/www/html/wordpress" --allow-root $SQL_USER $SQL_USER_MAIL --user_pass=$SQL_USER_PW

mkdir -p /run/php
printf "php-fpm7.4\n"
php-fpm7.4 -F
