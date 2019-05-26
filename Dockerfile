FROM ubuntu:xenial
MAINTAINER swapbyt3s@gmail.com

LABEL vendor="Swapbyt3s" description="MySQL Basic SQL Training" version="1.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils curl tzdata
RUN apt-get install -y mysql-server-5.7 mysql-client-core-5.7 mysql-utilities

COPY my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY entrypoint.sh /root/entrypoint.sh

RUN chown root:root /etc/mysql/mysql.conf.d/mysqld.cnf
RUN chmod a+x /root/entrypoint.sh
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 3306/tcp

ENTRYPOINT ["/root/entrypoint.sh"]
