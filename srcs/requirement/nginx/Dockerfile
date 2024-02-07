FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN	apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.ort -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=AuvergneRhoneAlpes/L=Lyon/O=42/OU=42/CN=llevasse.42.fr/UID=llevasse"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
