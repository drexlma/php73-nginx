FROM debian:buster-slim


ENV DEBIAN_FRONTEND noninteractive
# Locale
ENV LOCALE en_EN.UTF-8


RUN apt-get update && apt-get -y upgrade && apt-get -yqq install curl wget vim 
  

RUN apt-get -y install \
  php7.3-fpm 		\
  php7.3-curl 		\
  php7.3-bcmath   \
  php7.3-bz2   \
  php7.3-dom		\
  php7.3-mbstring	\
  php7.3-mysql		\
  php7.3-zip		\
  postfix \
  nginx

RUN apt-get -y autoremove && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 



HEALTHCHECK  --interval=2m --timeout=3s --start-period=30s \
	CMD /etc/init.d/nginx status  || exit 1 



EXPOSE 80

ADD entrypoint.sh /entrypoint.sh
ADD default /etc/nginx/sites-enabled/default
ENTRYPOINT ["/entrypoint.sh"]

CMD bash

