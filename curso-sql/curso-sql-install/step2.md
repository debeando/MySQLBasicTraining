Verificar que el proceso `mysqld` este ejecutándose:

`ps -U mysql`{{execute}}

Deberíamos ver la siguiente salida aproximada de datos:

```
    PID TTY          TIME CMD
  16917 ?        00:00:01 mysqld
```

La primera línea es el proceso `mysqld`.

Si hay algún problema al iniciar el servicio MySQL deberá revisar el log de errores:

```
tail /var/log/mysql/error.log
```

Para efectos de este curso no trataremos resolución de errores, pero si informamos que es buena practica revisar dicho log en caso de haber problemas.
