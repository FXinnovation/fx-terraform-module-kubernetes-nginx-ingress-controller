output "namespace" {
  value = element(concat(kubernetes_namespace.this.*, list({})), 0)
}

output "deployment" {
  value = element(concat(kubernetes_deployment.this.*, list({})), 0)
}

output "service" {
  value = element(concat(kubernetes_service.this.*, list({})), 0)
}

output "service_account" {
  value = element(concat(kubernetes_service_account.this.*, list({})), 0)
}

output "cluster_role" {
  value = element(concat(kubernetes_cluster_role.this.*, list({})), 0)
}

output "cluster_role_binding" {
  value = element(concat(kubernetes_cluster_role_binding.this.*, list({})), 0)
}

output "role" {
  value = element(concat(kubernetes_role.this.*, list({})), 0)
}

output "role_binding" {
  value = element(concat(kubernetes_role_binding.this.*, list({})), 0)
}

output "config_map_nginx_configuration" {
  value = element(concat(kubernetes_config_map.nginx_configuration.*, list({})), 0)
}

output "config_map_tcp_services" {
  value = element(concat(kubernetes_config_map.tcp_services.*, list({})), 0)
}

output "config_map_udp_services" {
  value = element(concat(kubernetes_config_map.udp_services.*, list({})), 0)
}
