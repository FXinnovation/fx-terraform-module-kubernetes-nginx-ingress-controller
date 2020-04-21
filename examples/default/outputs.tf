output "namespace" {
  value = module.default.namespace
}

output "deployment" {
  value = module.default.deployment
}

output "service" {
  value = module.default.service
}

output "service_account" {
  value = module.default.service_account
}

output "cluster_role" {
  value = module.default.cluster_role
}

output "cluster_role_binding" {
  value = module.default.cluster_role_binding
}

output "role" {
  value = module.default.role
}

output "role_binding" {
  value = module.default.role_binding
}

output "config_map_nginx_configuration" {
  value = module.default.config_map_nginx_configuration
}

output "config_map_tcp_services" {
  value = module.default.config_map_tcp_services
}

output "config_map_udp_services" {
  value = module.default.config_map_udp_services
}

output "load_balancer_ingress" {
  value = module.default.load_balancer_ingress
}
