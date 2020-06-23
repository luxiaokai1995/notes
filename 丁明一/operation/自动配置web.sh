#!/bin/bash
#自动配置动态web
file=/usr/local/nginx/conf/nginx.conf
tar -xf lnmp_soft.tar.gz
cd lnmp_soft
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure
make
make install
yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-fpm php-mysql
sed -i '65,71s/#//' $file
sed -i '/SCRIPT_FILENAME/d' $file
sed -i '/fastcgi_params/s/fastcgi_params/fastcgi.conf/' $file
/usr/local/nginx/sbin/nginx
systemctl start php-fpm
systemctl start mariadb
