Nos conectamos a la consola de MySQL en local, internamente sin enterarnos el comando buscará un fichero de configuración con los valores necesarios para establecer la conexión o usará los valores por defecto:

`mysql`{{execute}}

De momento se conecta con los valores por defecto, pero con el mismo comando más una serie de parámetros podrá cambiar los valores por defecto de una conexión:

```
mysql -h <host> -P <port> -u <user> -p<password> <schema>
```

En el caso de una instalación local sin ser alterada y en el caso de Ubuntu, podemos consultar los datos de acceso del MySQL de la siguiente forma:

`cat /etc/mysql/debian.cnf`{{execute}}

Salida de ejemplo del comando anterior:

```
# Automatically generated for Debian scripts. DO NOT TOUCH!
[client]
host     = localhost
user     = debian-sys-maint
password = Dx1JmiHbI3If7iqa
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = Dx1JmiHbI3If7iqa
socket   = /var/run/mysqld/mysqld.sock
```

Es importante recordar que los datos de este fichero son diferentes en cada instalación, son generados de forma automática, nosotros mostramos una salida de ejemplo para poder seguir con el curso, usted deberá adaptarlos.

Ahora que tenemos toda la información necesaria podremos completar el comando para conectarnos al MySQL usando valores definidos por nosotros.

`mysql -h 127.0.0.1 -u debian-sys-maint -pDx1JmiHbI3If7iqa`

**NOTA:** Es muy importante recordar que el parámetro y la clave van juntos así `-pDx1JmiHbI3If7iqa` y no `-p Dx1JmiHbI3If7iqa`, el resto de los parámetros admite el espacio como suele ser.

De esta forma podrá conectarse a servidores que estén en otro sitio siempre y cuando conozca los datos de acceso.
