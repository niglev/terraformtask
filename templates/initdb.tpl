#!/bin/bash

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
sudo wget https://config-wp-s3-bucket.s3.us-east-2.amazonaws.com/K2kf3i4oOsu3j4ksoiu34657908lksdf/wpall.tar.gz -P /var/tmp
sudo /bin/tar -xzvf /var/tmp/wpall.tar.gz -C /var/tmp/
sudo /bin/sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo /usr/bin/mysql -uroot < /var/tmp/wpall.sql   
sudo systemctl restart mysql.service
