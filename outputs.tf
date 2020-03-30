output "namespace" {
  description = "Namespace in which the module is deployed."
  value       = var.namespace_name
}

output "deployment_name" {
  description = "Name of the deployment created by this module."
  value       = var.deployment_name
}

output "service_name" {
  description = "Name of the service created by this module."
  value       = var.service_name
}

output "nginx_configuration_name" {
  description = "Name of the nginx configuration config map created by this module."
  value       = var.nginx_configuration_name
}

output "tcp_services_name" {
  description = "Name of the tcp_services config map created by this module."
  value       = var.tcp_services_name
}

output "udp_services_name" {
  description = "Name of the udp_services config map created by this module."
  value       = var.udp_services_name
}

output "load_balancer_ingress" {
  description = "List of ingress points for the load-balancer."
  value       = kubernetes_service.this.load_balancer_ingress
}
