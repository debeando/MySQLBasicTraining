#!/bin/bash
# encoding: UTF-8
set -e

DATADIR="/var/lib/mysql"
SOCKETDIR="/var/run/mysqld/"
SOCKET="/var/run/mysqld/mysqld.sock"
CMD=(mysql --protocol=socket -uroot --socket="$SOCKET")

rm -rf "$DATADIR"
mkdir -p "$DATADIR"
mkdir -p "$SOCKETDIR"
chown -R mysql:mysql "$DATADIR"
chown -R mysql:root "$SOCKETDIR"
> /var/log/mysql/error.log

echo '[Entrypoint] Initializing database.'
mysqld --initialize-insecure \
       --datadir="$DATADIR"
echo '[Entrypoint] Database initialized.'

mysqld --daemonize --skip-networking --socket="$SOCKET"

if [ ! -z "" ];
then
  for i in {30..0}; do
    if mysqladmin --socket="$SOCKET" ping &>/dev/null; then
      break
    fi
    echo '[Entrypoint] Waiting for server...'
    sleep 1
  done
  if [ "$i" = 0 ]; then
    echo >&2 '[Entrypoint] Timeout during MySQL init.'
    exit 1
  fi
fi

echo "[Entrypoint] Populate TimeZone..."
# With "( .. ) 2> /dev/null" suppress any std[out/err].
( mysql_tzinfo_to_sql /usr/share/zoneinfo | "${CMD[@]}" --force ) 2> /dev/null

echo "[Entrypoint] Create users."
"${CMD[@]}" <<-EOSQL
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS employees;
GRANT ALL PRIVILEGES ON *.* TO 'employees'@'%' IDENTIFIED BY 'employees';
GRANT ALL PRIVILEGES ON *.* TO 'employees'@'localhost' IDENTIFIED BY 'employees';
FLUSH PRIVILEGES;
EOSQL

echo "[Entrypoint] Restoring employees database..."
cd /root/
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/employees.sql --output employees.sql
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_departments.dump --output load_departments.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_employees.dump --output load_employees.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_dept_emp.dump --output load_dept_emp.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_dept_manager.dump --output load_dept_manager.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_titles.dump --output load_titles.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_salaries1.dump --output load_salaries1.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_salaries2.dump --output load_salaries2.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/load_salaries3.dump --output load_salaries3.dump
curl --silent https://raw.githubusercontent.com/datacharmer/test_db/master/show_elapsed.sql --output show_elapsed.sql
("${CMD[@]}" employees < employees.sql) > /dev/null 2>&1

mysqladmin shutdown -uroot --socket="$SOCKET"

echo '[Entrypoint] MySQL init process done. Ready for start up.'
mysqld
