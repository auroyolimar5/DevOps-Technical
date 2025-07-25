output "load_balancer_url" {
  value = "http://localhost:${var.lb_port}/DevOps"
}

output "microservices_ports" {
  value = [for i in range(var.replicas) : "http://localhost:${8000 + i}/DevOps"]
}