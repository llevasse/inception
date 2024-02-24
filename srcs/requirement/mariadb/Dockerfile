FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server dumb-init systemd

ARG SQL_DATABASE
ARG SQL_ROOT_PW
ARG SQL_USER
ARG SQL_USER_PW

EXPOSE 3306
COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
RUN service mariadb start && mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PW}'; \
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PW}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}'; \
FLUSH PRIVILEGES;"
CMD [ "mysqld", "--bind-address=0.0.0.0" ]
