### Implementacion de este proyecto.

Este proyecto se diseño en un contenedor docker en un ambiente de desarrollo, por lo que si se va a implementar en un ambiente de produccion, se debe configurar un servidor web/proxy inverso y un servidor HTTP de interfaz de puerta de enlace para web Python.

Se utilizan las siguientes tecnologias:

- Python
- FastApi
- Docker
- 

## Crear la imagen para el contenedor Docker
```
docker build -t devops-msa  .
```

## Ubicar la ruta del proyecto y ejecutar el contenedor conla imagen creada

Sustituir directorio-local-app por el directorio donde tiene alojado el proyecto.

```
docker run -it -d --name casoams -p 8080:8080 -p 8000:8000  -v directorio-local-app:/app casoams
```

## Solicitar el token jwt

```
curl --location --request POST 'http://127.0.0.1:8000/token'
```

## Ejecutar la migracion de la api cliente

```
python3 manage.py makemigrations cliente
python3 manage.py migrate cliente
```
## Crear el usuario administrador

Para usar la aplacion de administracion que tiene Django, es necesario crear un superusuario, con el siguiente comando.
```
python3 manage.py createsuperuser
```
Una vez que levante el servidor, ingrese en la url http://127.0.0.1:8080/admin/


## Levantar el servidor en desarrollo, indicando el puerto
```
python3 manage.py runserver 0:8080
```
Este comando levanta el proyecto en un entorno de desarrollo (debug), en el puerto 8080, que es el que se indico en Docker. Si quiere usar el puerto 8000, se tiene que definir antes de crear el contenedor.

## Consultar al endponit 
Ingresar a la url http://127.0.0.1:8080/api/clientes/
Lista los usuarios creados en la base de datos usando el metodo GET.