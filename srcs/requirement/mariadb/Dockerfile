FROM debian:buster-slim

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server

ARG SQL_DATABASE
ARG SQL_ROOT_PW
ARG SQL_USER
ARG SQL_USER_PW


RUN service mysql start && \
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}';\
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_ROOT_PW}'; \
FLUSH PRIVILEGES;"

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
