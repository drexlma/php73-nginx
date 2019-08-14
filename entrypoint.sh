#!/bin/sh
nginx -t 
chmod 0600 /var/spool/cron/crontabs/root
chown root:crontab /var/spool/cron/crontabs/root

service syslog-ng start 
service nginx start 

service php7.3-fpm start 

service postfix start 
service cron start 
tail -F /var/log/nginx/error.log /var/log/cron.log
