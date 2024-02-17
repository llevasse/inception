FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server dumb-init

ARG SQL_DATABASE
ARG SQL_ROOT_PW
ARG SQL_USER
ARG SQL_PW

EXPOSE 3306
COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
RUN service mysql start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}; ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}'; CREATE USER ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PW}'; GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%'; FLUSH PRIVILEGES;"
# && mysqladmin -u root -p$SQL_ROOT_PW shutdown && exec mysqld_safe
