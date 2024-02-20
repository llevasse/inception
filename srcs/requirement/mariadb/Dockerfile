FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server dumb-init

ARG SQL_DATABASE
ARG SQL_ROOT_PW
ARG SQL_USER
ARG SQL_PW

EXPOSE 3306
COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY conf/create_db.sh /create_db.sh
RUN chmod +x /create_db.sh

ENTRYPOINT [ "bash", "/create_db.sh" ]
