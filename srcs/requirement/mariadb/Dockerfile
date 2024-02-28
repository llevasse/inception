FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server

ARG SQL_DATABASE
ARG SQL_ROOT_PW
ARG SQL_USER
ARG SQL_USER_PW

EXPOSE 3306
COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY conf/create.sh /create.sh
RUN chmod +x /create.sh

ENTRYPOINT ["bash", "/create.sh"]
