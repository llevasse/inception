service mariadb start
echo cc1
mariadb -uroot -p${SQL_ROOT_PW} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo cc2
mariadb -uroot -p${SQL_ROOT_PW} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PW}';"
echo cc3
mariadb -uroot -p${SQL_ROOT_PW} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PW}';"
echo cc4
mariadb -uroot -p${SQL_ROOT_PW} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PW}';"
echo cc5
mariadb -uroot -p${SQL_ROOT_PW} -e "FLUSH PRIVILEGES;"
echo cc6
