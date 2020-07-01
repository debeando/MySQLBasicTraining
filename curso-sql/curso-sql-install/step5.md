Descargar la base de datos de [prueba del sitio oficial de MySQL](https://dev.mysql.com/doc/sakila/en/sakila-installation.html) desde la línea de comandos y restaurarla:

```bash
wget https://downloads.mysql.com/docs/sakila-db.tar.gz
tar -zxvf sakila-db.tar.gz
cd sakila-db/
mysql < sakila-schema.sql
mysql < sakila-data.sql
```

La base de datos se llama *sakila* por qué es el nombre del delfín que representa MySQL, esta es una base de datos que contiene datos ficticios de un alquiler de películas, tenemos tablas de inventario, películas, clientes, pagos y mucho más.

Ahora entramos nuevamente a la consola de MySQL como hicimos en el paso 4 y ejecutamos la siguiente consulta para ver las bases de datos:

`SHOW DATABASES;`{{execute}}

En la lista seguro que esta la base de datos `sakila`.
