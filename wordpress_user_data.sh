#!/bin/bash

yum update -y

yum install -y httpd
yum install -y php php-mysqlnd php-fpm php-xml php-json php-common php-opcache php-gd php-xmlrpc

yum install -y mariadb-server

systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb

mysql_secure_installation <<EOF

y
n
y
y
EOF

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -f latest.tar.gz

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/wordpress/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/wp_user/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/password/" /var/www/html/wordpress/wp-config.php

chown -R apache:apache /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

systemctl restart httpd
