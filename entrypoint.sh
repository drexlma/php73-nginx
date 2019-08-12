#!/bin/sh
nginx -t 
service nginx start 
service php7.3-fpm start 

service postfix start 
tail -F /var/log/nginx/error.log
