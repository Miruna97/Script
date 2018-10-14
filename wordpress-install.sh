#!/bin/bash
path=$(pwd)
sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php7.0-mysql php7.0-curl php7.0-json php7.0-cgi  php7.0 libapache2-mod-php7.0 -y
sudo service apache2 restart
sudo apt-get update
sudo apt-get install mysql-server -y
dbname="wwp"
dbuser="user"
userpass="qwe123"
rootpass="qwe123"
mysql -uroot -p$rootpass -e "CREATE DATABASE wp;"
cd $path && mkdir tmp
cd tmp
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cd wordpress
sudo mv * /var/www/html
cd /var/www/
sudo chmod 777 -R html
sudo apt-get update
sudo apt-get install phpmyadmin php-mbstring php-gettext -y
sudo service apache2 restart
cd $path
rm -rf tmp
cd /var/www/html 
rm -rf index.html 
