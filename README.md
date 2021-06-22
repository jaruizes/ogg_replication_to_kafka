# Replicación de cambios a Kafka con Oracle GoldenGate

Este repositorio muestra un ejemplo de replicación de cambios desde una tabla origen en Oracle y Kafka

# Requisitos

Para poder ejecutar este ejemplo necesitas;

- Docker
- Credenciales de consola de un usuario de AWS con permiso para manejar EC2, RDS Oracle, MSK, VPC, Security Groups

# Setup

## SSH

Es necesario generar las claves SSH que usará Terraform para montar las instancias EC2 y que posteriormente usaremos para conectarnos a ellas. Debemos lanzar:

```
ssh-keygen -q -N "" -f iac/ssh/ssh_gg
```

que creará dentro de la carpeta iac/ssh el par de claves SSH.



## Infraestructura en AWS

Se proporciona un fichero Dockerfile que monta una imagen con Terraform y el cliente de AWS para no tener que instalarlo en local.

Para construir la imagen, debes ejecutar:

```
docker build . -t ogg_bidirectional
```

Una vez construida la imagen, ejecuta el siguiente comando para entrar en el bash del contenedor:

```
docker run -it --rm -e KEY_ID=<AWS_USER_KEY_ID> -e SECRET_ID=<AWS_SECRET_KEY_ID> -v $(pwd)/iac:/root/iac --entrypoint /bin/bash ogg_bidirectional
```

reemplazando:

- AWS_USER_KEY_ID por el ID del usuario de consola de AWS
- AWS_SECRET_KEY_ID por el SECRET del usuario de consola de AWS

Una vez dentro, para construir la infraestructura, ejecuta:

```
sh build.sh
```

Y sigue los pasos enumerados en el post para construir el ejemplo

# Destruir el entorno

El entorno se crea en AWS por lo que es necesario destruirlo cuando hayas completado el ejemplo. Para ello, volvemos a entrar en el bash del contenedor:

Una vez construida la imagen, ejecuta el siguiente comando para entrar en el bash del contenedor:

```
docker run -it --rm -e KEY_ID=<AWS_USER_KEY_ID> -e SECRET_ID=<AWS_SECRET_KEY_ID> -v $(pwd)/iac:/root/iac --entrypoint /bin/bash ogg_bidirectional
```

reemplazando:

- AWS_USER_KEY_ID por el ID del usuario de consola de AWS
- AWS_SECRET_KEY_ID por el SECRET del usuario de consola de AWS

Una vez dentro, ejecutamos:

```
sh destroy.sh
```

