service mysql start
echo "CREATE DATABASE IF NOT EXISTS InfoMySql;" | mysql -u root
echo "CREATE USER IF NOT EXISTS 'mamaurai'@'localhost' IDENTIFIED BY 'InceptionVM42';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'mamaurai'@'%' IDENTIFIED BY 'InceptionVM42' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
