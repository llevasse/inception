FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN	apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx
COPY /conf/nginx.conf /etc/nginx/sites-available/llevasse.42.fr.conf


RUN ln -s /etc/nginx/sites-available/llevasse.42.fr.conf /etc/nginx/sites-enabled/llevasse.42.fr.conf

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=AuvergneRhoneAlpes/L=Lyon/O=42/OU=42/CN=llevasse.42.fr/UID=llevasse"


RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
