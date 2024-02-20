printf "lunch create_db.sh\n"

service mysql start

printf "create db\n"
mysql -u root -p${SQL_ROOT_PW} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
printf "create root\n"
mysql -u root -p${SQL_ROOT_PW} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}';"
printf "create user\n"
mysql -u root -p${SQL_ROOT_PW} -e "CREATE USER \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PW}';"
printf "grant\n"
mysql -u root -p${SQL_ROOT_PW} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
printf "flush\n"
mysql -u root -p${SQL_ROOT_PW} -e "FLUSH PRIVILEGES;"
mysqladmin -p${SQL_ROOT_PW} shutdown
exec mysqld_safe
