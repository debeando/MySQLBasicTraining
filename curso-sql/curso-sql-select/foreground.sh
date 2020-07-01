apt-get install -y mysql-server && \
wget https://downloads.mysql.com/docs/sakila-db.tar.gz && \
tar -zxvf sakila-db.tar.gz && \
cd sakila-db/ && \
mysql < sakila-schema.sql && \
mysql < sakila-data.sql && \
mysql sakila
