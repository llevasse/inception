FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget php php-fpm php-mysql mariadb-client -y

EXPOSE 9000

RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www/

RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /tmp/config.sh
RUN chmod +x /tmp/config.sh

ENTRYPOINT ["bash", "/tmp/config.sh"]
