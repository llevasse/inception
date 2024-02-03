FROM scratch

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y dumb-init mariadb-server dumb-init

ARG DB_NAME
ARG DB_USER
ARG DB_USER_PW
ARG DB_ROOT_PW

RUN service mysql start && mysql -u root -e "CREATE DATABASE I NOT EXISTS ${DB_NAME}; ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PW}'; CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_USER_PW}'; GRANT ALL PRIVILEGES ON ${DB_NME}.* TO '${DU_USER}'@'%'; FLUSH PRIVILEGES;"

# 3306 = mySql connection
EXPOSE	3306


#lunch dumb-init first. dumb-init = process supervisor forwarding signals to children (PID1 in container)
ENTRYPOINT	["/usr/bin/dumb-init", "--"]
CMD ["mysqld", "--bind-address=0.0.0.0"]
