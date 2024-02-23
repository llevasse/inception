service mysql start;
printf "Lunch mysql command\n"
mysql -u root -p${SQL_ROOT_PW} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PW}'; \
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PW}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}'; \
FLUSH PRIVILEGES;"
printf "Lunch mysqladmin command\n"
chmod 755 -R /var/run/mysqld
chown root:root /var/run/mysqld	#/var/run/mysqld.sock is deleted without this line ¯\_(ツ)_/¯
mysqladmin -u root -p${SQL_ROOT_PW} shutdown
echo 'ls' `ls -R /var/run/mysqld`
#printf "Lunch mysqld_safe\n"
#exec mysqld_safe

