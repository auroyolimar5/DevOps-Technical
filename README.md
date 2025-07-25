### Implementacion de este proyecto.

Este proyecto se diseño en un microservicio en python:

Se utilizan las siguientes tecnologias:

- Python
- FastApi
- Docker
- 

## Crear la imagen para el contenedor Docker
```
docker build -t devops-msa  .
```

## Para realizar una prueba en docker

Levantar un contenedor

```
docker run -d -p 8000:8000 --name my-app devops-msa
```

## Solicitar un nuevo token jwt

```
curl --location --request POST 'http://127.0.0.1:8000/token'
```
## Realizar la consulta
```curl
curl --location 'http://127.0.0.1:8000/DevOps' \
--header 'X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c' \
--header 'X-JWT-KWY: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTM0MTM4MTB9.0ngYjNjc9y-YnFHLfvJZZS7cQVFPzRf-_qEUgRbfj6g' \
--header 'Content-Type: application/json' \
--data '{"message" : "This is a test", 
"to": "Juan Perez", 
"from": "Rita Asturia", 
"timeToLifeSec": 45 
}'
```

## Consu