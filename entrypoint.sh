#!/bin/sh
nginx -t 
service nginx start 
service php7.3-fpm start 

service postfix start 
service cron start 
tail -F /var/log/nginx/error.log /var/log/cron.log
