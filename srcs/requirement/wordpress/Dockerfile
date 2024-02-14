FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget php php-fpm php-mysql mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress
