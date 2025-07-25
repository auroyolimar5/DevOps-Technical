### Implementacion de este proyecto.

Este proyecto se diseño en un microservicio en python:

Se utilizan las siguientes tecnologias:

- Kubernetes
- Docker
- Terraform 
- Python

## Clonar el repositorio

```
https://github.com/auroyolimar5/DevOps-Technical.git
```

## Crear la imagen para el contenedor Docker
```
docker build -t devops-msa  .
```

## Para realizar una prueba en docker local

Levantar un contenedor

```
docker run -d -p 8000:8000 --name my-app devops-msa
```
## Para probar en local

### Solicitar un nuevo token jwt

```
curl --location --request POST 'http://127.0.0.1:8000/token'
```
### Realizar la consulta
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

## Despliegue en Kubernetes

### Configurar kubectl

Se debe de tener configurado kubectl para el cluster.

### Aplicar los manifiestos Kubernetes
```
kubectl apply -f k8s/
```

### Verificar el despliegue
```
kubectl get pods
kubectl get services
```

## Infraestructura como Código (Terraform)

### Inicializar Terraform
```bash
cd infra
terraform init
```

### Revisar plan de despliegue
```
terraform plan
```

### Aplicar la configuración
```
terraform apply
```

## Pipeline CI/CD

El pipeline está configurado en GitHub Actions y se ejecuta automaticamente en:

- Push a cualquier rama (ejecuta build y tests)

- Push a main (ejecuta despliegue a producción)

### Etapas del pipeline:
- **Build:** Construye la imagen Docker

- **Deploy (solo main):** Despliega en Kubernetes

