FROM ubuntu:xenial
MAINTAINER swapbyt3s@gmail.com

LABEL vendor="Swapbyt3s" description="MySQL Basic SQL Training" version="1.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils curl tzdata zlib1g
RUN apt-get install -y mysql-server-5.7 mysql-client-core-5.7 mysql-utilities
RUN apt-get install -y apache2
RUN apt-get install -y phpmyadmin php-mbstring php-gettext php-bz2

COPY my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY entrypoint.sh /root/entrypoint.sh
COPY phpmyadmin.conf /etc/apache2/conf-available/phpmyadmin.conf
COPY config.inc.php /usr/share/phpmyadmin/config.inc.php

RUN chown root:root /etc/mysql/mysql.conf.d/mysqld.cnf
RUN chmod a+x /root/entrypoint.sh
RUN rm -rf /var/lib/apt/lists/*
RUN > /var/www/html/index.html
RUN rm -f /usr/share/phpmyadmin/config.sample.inc.php
RUN phpenmod mbstring
RUN a2enconf phpmyadmin.conf

EXPOSE 3306/tcp 80/tcp

ENTRYPOINT ["/root/entrypoint.sh"]
