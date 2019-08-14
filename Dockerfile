FROM debian:buster-slim


LABEL Description="WWW Projekt" Vendor="Daniel Drexlmaier" Version="1.7" maintainer="Daniel Drexlmaier"

ENV DEBIAN_FRONTEND noninteractive
ENV LOCALE en_EN.UTF-8


RUN apt-get update && apt-get -y upgrade && apt-get -yqq install curl wget vim php7.3-fpm syslog-ng 		\
  php7.3-curl 		\
  php7.3-bcmath   \
  php7.3-bz2   \
  php7.3-dom		\
  php7.3-mbstring	\
  php7.3-mysql		\
  php7.3-zip		\
  postfix \
  cron \ 
  nginx && \
apt-get -y autoremove && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 



HEALTHCHECK  --interval=2m --timeout=3s --start-period=30s \
	CMD /etc/init.d/nginx status  || exit 1 



EXPOSE 80

ADD entrypoint.sh /entrypoint.sh
ADD default /etc/nginx/sites-enabled/default
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD bash

