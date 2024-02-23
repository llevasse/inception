service mysql start;
printf "Lunch mysql command\n"
mysql -u root -p${SQL_ROOT_PW} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PW}'; \
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PW}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}'; \
FLUSH PRIVILEGES;"
#printf "Lunch mysqladmin command\n"
echo "ls " `ls -R /var/run/mysqld`
echo "ls " `ls -R /run/mysqld`
mysqladmin -p${SQL_ROOT_PW} shutdown
#printf "Lunch mysqld_safe\n"
#exec mysqld_safe

