terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # host = "unix:///var/run/docker.sock" # Para Linux/macOS
  host = "npipe:////.//pipe//docker_engine" # Para Windows
}

# Crear una red Docker para aislar los contenedores
resource "docker_network" "devops_net" {
  name = "devops-network"
}

# Desplegar múltiples instancias del microservicio
resource "docker_container" "microservice" {
  count = var.replicas
  name  = "devops-msa-${count.index}"
  image = var.docker_image
  ports {
    internal = var.api_port
    external = 8000 + count.index
  }
  networks_advanced {
    name = docker_network.devops_net.name
  }
}

# Configurar Nginx como balanceador de carga
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "load_balancer" {
  name  = "devops-load-balancer"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = var.lb_port
  }
  volumes {
    container_path = "/etc/nginx/conf.d/default.conf"
    host_path      = "/DevOps-Technical/terraform/nginx.conf"
  }
  networks_advanced {
    name = docker_network.devops_net.name
  }
  depends_on = [docker_container.microservice]
}