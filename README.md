# MySQL Basic SQL Training

This project help student to have immediate example environment to training the course. This image provides a ready to use example database for the docker container. It contains MySQL 5.7 on ubuntu and a couple of databases:

## Example Databases

- [Employees](https://dev.mysql.com/doc/employee/en/)
- [Sakila](https://dev.mysql.com/doc/sakila/en/)

## Usage

Execute the follow comands:

```
$ git clone git@github.com:swapbyt3s/MySQLBasicSQLTraining.git
$ cd MySQLBasicTraining/
$ docker-compose up
```

When you are finished, run the follow command to clear environment:

```
$ docker-compose down
```

### phpMyAdmin

Open your web browser and navigate to [http://127.0.0.1:8080](http://127.0.0.1:8080). You should see the phpmyadmin login page. Log in to the phmyadmin interface either using MySQL **root** user and **admin** password.

### Terminal

Maybe do you like enter via Terminal:

```
docker exec -i -t mysqlbasicsqltraining_mysql_1 /usr/bin/mysql -u root -padmin
```

## Appreciation

- Thanks by Giuseppe Maxia (datacharmer) to build [sample database](https://github.com/datacharmer/test_db) for MySQL.

## Issues

If you have any problems with or questions about this image or MySQL Basic SQL Training, please contact us through a [GitHub](https://github.com/swapbyt3s/MySQLBasicTraining/issues) issue.
