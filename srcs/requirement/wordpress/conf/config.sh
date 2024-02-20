printf "Lunch config.sh\n"

sleep 10
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	printf "No wp-config.php found\n"
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_ROOT_PW --dbhost=mariadb:3306 --path='/var/www/wordpress'
	printf "mais connard\n"

	wp core install	--path="/var/www/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$SQL_ROOT --admin_password=$SQL_ROOT_PW --admin_email=$SQL_ROOT_MAIL

	wp user create --path="/var/www/wordpress" --allow-root $SQL_USER $SQL_USER_MAIL --user_pass=$SQL_USER_PW
fi

mkdir -p /run/php
php-fpm7.3 -F
php-fpm8.2 -F
