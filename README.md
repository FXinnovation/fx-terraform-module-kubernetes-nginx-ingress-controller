# terraform-module-kubernetes-nginx-ingress-controller

Terraform module to deploy nginx-ingress-controller on kubernetes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_config_map.nginx_configuration](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_config_map.tcp_services](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_config_map.udp_services](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_role.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_service.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service_account.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionnal_args"></a> [additionnal\_args](#input\_additionnal\_args) | List of additionnal arguments to pass to the nginx-ingress-controller. | `list` | `[]` | no |
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Map of annotations that will be merged with all other annotations on all kubernetes resources. | `map` | `{}` | no |
| <a name="input_annotations_prefix"></a> [annotations\_prefix](#input\_annotations\_prefix) | Annotations that nginx-ingress-controller will watch on ingresses. | `string` | `"nginx.ingress.kubernetes.io"` | no |
| <a name="input_cluster_role_annotations"></a> [cluster\_role\_annotations](#input\_cluster\_role\_annotations) | Map of annotations to apply to the cluster role. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_annotations"></a> [cluster\_role\_binding\_annotations](#input\_cluster\_role\_binding\_annotations) | Map of annotations to apply to the cluster role binding. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_labels"></a> [cluster\_role\_binding\_labels](#input\_cluster\_role\_binding\_labels) | Map of labels to apply to the cluster role binding. | `map` | `{}` | no |
| <a name="input_cluster_role_binding_name"></a> [cluster\_role\_binding\_name](#input\_cluster\_role\_binding\_name) | Name of the cluster role binding to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.* | `string` | `"ingress-nginx"` | no |
| <a name="input_cluster_role_labels"></a> [cluster\_role\_labels](#input\_cluster\_role\_labels) | Map of labels to apply to the cluster role. | `map` | `{}` | no |
| <a name="input_cluster_role_name"></a> [cluster\_role\_name](#input\_cluster\_role\_name) | Name of the cluster role to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.* | `string` | `"ingress-nginx"` | no |
| <a name="input_config_map_annotations"></a> [config\_map\_annotations](#input\_config\_map\_annotations) | Map of annotations to apply to all config maps. | `map` | `{}` | no |
| <a name="input_config_map_labels"></a> [config\_map\_labels](#input\_config\_map\_labels) | Map of labels to apply to all config maps. | `map` | `{}` | no |
| <a name="input_controller_host_port"></a> [controller\_host\_port](#input\_controller\_host\_port) | Port number on which the controller will be available on the host (0-65536) | `number` | `null` | no |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Map of annotations to apply to the deployment. | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Map of labels to apply to the deployment. | `map` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment to create for nginx-ingress-controller. | `string` | `"ingress-nginx"` | no |
| <a name="input_deployment_template_annotations"></a> [deployment\_template\_annotations](#input\_deployment\_template\_annotations) | Map of annotations to apply to the deployment template. | `map` | `{}` | no |
| <a name="input_deployment_template_labels"></a> [deployment\_template\_labels](#input\_deployment\_template\_labels) | Map of labels to apply to the deployment template. | `map` | `{}` | no |
| <a name="input_election_id"></a> [election\_id](#input\_election\_id) | Election id to use for Ingress status updates. | `string` | `"ingress-controller-leader"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the image to use. | `string` | `"quay.io/kubernetes-ingress-controller/nginx-ingress-controller"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Version of the image to use. | `string` | `"0.26.1"` | no |
| <a name="input_ingress_class"></a> [ingress\_class](#input\_ingress\_class) | Name of the ingress class this controller satisfies. The class of an Ingress object is set using the annotation "kubernetes.io/ingress.class". | `string` | `"nginx"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels that will be merged with all other labels on all kubernetes resource. | `map` | `{}` | no |
| <a name="input_namespace_annotations"></a> [namespace\_annotations](#input\_namespace\_annotations) | Map of annotations to apply to the namespace. | `map` | `{}` | no |
| <a name="input_namespace_labels"></a> [namespace\_labels](#input\_namespace\_labels) | Map of labels to apply to the namespace. | `map` | `{}` | no |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the namespace to create and deploy the nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to run in it's own namespace.* | `string` | `"ingress-nginx"` | no |
| <a name="input_nginx_configuration_annotations"></a> [nginx\_configuration\_annotations](#input\_nginx\_configuration\_annotations) | Map of annotations to apply to the nginx\_configuration config map. | `map` | `{}` | no |
| <a name="input_nginx_configuration_data"></a> [nginx\_configuration\_data](#input\_nginx\_configuration\_data) | Map representing the configuration for nginx-ingress-controller. | `map` | `{}` | no |
| <a name="input_nginx_configuration_labels"></a> [nginx\_configuration\_labels](#input\_nginx\_configuration\_labels) | Map of labels to apply to the nginx\_configuration config map. | `map` | `{}` | no |
| <a name="input_nginx_configuration_name"></a> [nginx\_configuration\_name](#input\_nginx\_configuration\_name) | Name of the nginx\_configuration config map to create. | `string` | `"nginx-configuration"` | no |
| <a name="input_node_selector"></a> [node\_selector](#input\_node\_selector) | Map of key value that will be used to select appropriate nodes | `map` | <pre>{<br>  "kubernetes.io/os": "linux"<br>}</pre> | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replica's to deploy. | `number` | `3` | no |
| <a name="input_role_annotations"></a> [role\_annotations](#input\_role\_annotations) | Map of annotations to apply to the role. | `map` | `{}` | no |
| <a name="input_role_binding_annotations"></a> [role\_binding\_annotations](#input\_role\_binding\_annotations) | Map of annotations to apply to the role binding. | `map` | `{}` | no |
| <a name="input_role_binding_labels"></a> [role\_binding\_labels](#input\_role\_binding\_labels) | Map of labels to apply to the role binding. | `map` | `{}` | no |
| <a name="input_role_binding_name"></a> [role\_binding\_name](#input\_role\_binding\_name) | Name of the role binding to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.* | `string` | `"ingress-nginx"` | no |
| <a name="input_role_labels"></a> [role\_labels](#input\_role\_labels) | Map of labels to apply to the role. | `map` | `{}` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the role to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.* | `string` | `"ingress-nginx"` | no |
| <a name="input_service_account_annotations"></a> [service\_account\_annotations](#input\_service\_account\_annotations) | Map of annotations to apply to the service account. | `map` | `{}` | no |
| <a name="input_service_account_labels"></a> [service\_account\_labels](#input\_service\_account\_labels) | Map of labels to apply to the service account. | `map` | `{}` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of the service account to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.* | `string` | `"ingress-nginx"` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Map of annotations to apply to the service. | `map` | `{}` | no |
| <a name="input_service_external_traffic_policy"></a> [service\_external\_traffic\_policy](#input\_service\_external\_traffic\_policy) | The external traffic policy for the service. | `string` | `"Local"` | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | Map of labels to apply to the service. | `map` | `{}` | no |
| <a name="input_service_load_balancer_ip"></a> [service\_load\_balancer\_ip](#input\_service\_load\_balancer\_ip) | IP address to be used for the service. | `string` | `null` | no |
| <a name="input_service_load_balancer_source_ranges"></a> [service\_load\_balancer\_source\_ranges](#input\_service\_load\_balancer\_source\_ranges) | List of source ranges that will be allowed access to the load balancer. | `list(string)` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service to create for nginx-ingress-controller. | `string` | `"ingress-nginx"` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Type of service to create for the nginx-ingress-controller. | `string` | `"LoadBalancer"` | no |
| <a name="input_tcp_services_annotations"></a> [tcp\_services\_annotations](#input\_tcp\_services\_annotations) | Map of annotations to apply to the tcp\_services config map. | `map` | `{}` | no |
| <a name="input_tcp_services_data"></a> [tcp\_services\_data](#input\_tcp\_services\_data) | Map representing the tcp services configuration for nginx-ingress-configuration. | `map` | `{}` | no |
| <a name="input_tcp_services_labels"></a> [tcp\_services\_labels](#input\_tcp\_services\_labels) | Map of labels to apply to the tcp\_services config map. | `map` | `{}` | no |
| <a name="input_tcp_services_name"></a> [tcp\_services\_name](#input\_tcp\_services\_name) | Name of the tcp\_services config map to create. | `string` | `"tcp-services"` | no |
| <a name="input_udp_services_annotations"></a> [udp\_services\_annotations](#input\_udp\_services\_annotations) | Map of annotations to apply to the udp\_services config map. | `map` | `{}` | no |
| <a name="input_udp_services_data"></a> [udp\_services\_data](#input\_udp\_services\_data) | Map representing the tcp services configuration for nginx-ingress-configuration. | `map` | `{}` | no |
| <a name="input_udp_services_labels"></a> [udp\_services\_labels](#input\_udp\_services\_labels) | Map of labels to apply to the udp\_services config map. | `map` | `{}` | no |
| <a name="input_udp_services_name"></a> [udp\_services\_name](#input\_udp\_services\_name) | Name of the udp\_services config map to create. | `string` | `"udp-services"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_annotation_prefix"></a> [annotation\_prefix](#output\_annotation\_prefix) | Annotation prefix to be used by this ingress controller. |
| <a name="output_cluster_role"></a> [cluster\_role](#output\_cluster\_role) | n/a |
| <a name="output_cluster_role_binding"></a> [cluster\_role\_binding](#output\_cluster\_role\_binding) | n/a |
| <a name="output_config_map_nginx_configuration"></a> [config\_map\_nginx\_configuration](#output\_config\_map\_nginx\_configuration) | n/a |
| <a name="output_config_map_tcp_services"></a> [config\_map\_tcp\_services](#output\_config\_map\_tcp\_services) | n/a |
| <a name="output_config_map_udp_services"></a> [config\_map\_udp\_services](#output\_config\_map\_udp\_services) | n/a |
| <a name="output_deployment"></a> [deployment](#output\_deployment) | n/a |
| <a name="output_ingress_class"></a> [ingress\_class](#output\_ingress\_class) | Ingress-class to be used by this ingress controller. |
| <a name="output_load_balancer_ingress"></a> [load\_balancer\_ingress](#output\_load\_balancer\_ingress) | List of ingress points for the load-balancer. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | n/a |
| <a name="output_role"></a> [role](#output\_role) | n/a |
| <a name="output_role_binding"></a> [role\_binding](#output\_role\_binding) | n/a |
| <a name="output_service"></a> [service](#output\_service) | n/a |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
