#!/bin/bash

sudo apt-get update
sudo apt-get install -y php libapache2-mod-php php-mysql php-curl php-mbstring php-gd php-xml php-xmlrpc php-intl php-soap php-zip
sudo a2enmod rewrite
sudo /usr/bin/wget https://config-wp-s3-bucket.s3.us-east-2.amazonaws.com/K2kf3i4oOsu3j4ksoiu34657908lksdf/html.tar.gz -P /var/tmp
sudo /bin/tar -xzvf /var/tmp/html.tar.gz -C /var/www/
sudo chown -Rf www-data:www-data /var/www/html
sudo rm -f /var/www/html/index.html
sudo /bin/sed -i "s/ip-10-0-2-106.us-east-2.compute.internal/${database_address}/g" /var/www/html/wp-config.php
sudo service apache2 restart

