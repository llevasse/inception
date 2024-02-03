FROM scratch

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y dumb-init nginx openssl

COPY /conf/nginx.conf	/etc/nginx/sites-available/llevasse.42.fr.conf
RUN ln -s /etc/nginx/sites-available/llevasse.42.fr.conf /etc/nginx/sites-enabled/llevasse.42.fr.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/llevasse.42.fr.key \
	-out /etc/ssl/certs/llevasse.42.fr.crt -subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/UID=llevasse/emailAddress=llevasse@student.42lyon.fr"

# 443 = https
EXPOSE	443


#lunch dumb-init first. dumb-init = process supervisor forwarding signals to children (PID1 in container)
ENTRYPOINT	["/usr/bin/dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]
