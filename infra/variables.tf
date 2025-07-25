variable "docker_image" {
  description = "devops-msa"
  default     = "devops-msa:latest"
}

variable "replicas" {
  description = "Numero de instancias del microservicio"
  default     = 2
}

variable "api_port" {
  description = "Puerto expuesto por el microservicio"
  default     = 8000
}

variable "lb_port" {
  description = "Puerto del balanceador de carga"
  default     = 80
}