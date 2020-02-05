# terraform-module-kubernetes-nginx-ingress-controller

Terraform module to deploy nginx-ingress-controller on kubernetes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.10.0 |
| random | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| additionnal\_args | List of additionnal arguments to pass to the nginx-ingress-controller. | `list` | `[]` | no |
| annotations | Map of annotations that will be merged with all other annotations on all kubernetes resources. | `map` | `{}` | no |
| annotations\_prefix | Annotations that nginx-ingress-controller will watch on ingresses. | `string` | `"nginx.ingress.kubernetes.io"` | no |
| cluster\_role\_annotations | Map of annotations to apply to the cluster role. | `map` | `{}` | no |
| cluster\_role\_binding\_annotations | Map of annotations to apply to the cluster role binding. | `map` | `{}` | no |
| cluster\_role\_binding\_labels | Map of labels to apply to the cluster role binding. | `map` | `{}` | no |
| cluster\_role\_binding\_name | Name of the cluster role binding to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.\* | `string` | `"ingress-nginx"` | no |
| cluster\_role\_labels | Map of labels to apply to the cluster role. | `map` | `{}` | no |
| cluster\_role\_name | Name of the cluster role to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.\* | `string` | `"ingress-nginx"` | no |
| config\_map\_annotations | Map of annotations to apply to all config maps. | `map` | `{}` | no |
| config\_map\_labels | Map of labels to apply to all config maps. | `map` | `{}` | no |
| deployment\_annotations | Map of annotations to apply to the deployment. | `map` | `{}` | no |
| deployment\_labels | Map of labels to apply to the deployment. | `map` | `{}` | no |
| deployment\_name | Name of the deployment to create for nginx-ingress-controller. | `string` | `"ingress-nginx"` | no |
| election\_id | Election id to use for Ingress status updates. | `string` | `"ingress-controller-leader"` | no |
| image\_name | Name of the image to use. | `string` | `"quay.io/kubernetes-ingress-controller/nginx-ingress-controller"` | no |
| image\_version | Version of the image to use. | `string` | `"0.26.1"` | no |
| ingress\_class | Name of the ingress class this controller satisfies. The class of an Ingress object is set using the annotation "kubernetes.io/ingress.class". | `string` | `"nginx"` | no |
| labels | Map of labels that will be merged with all other labels on all kubernetes resource. | `map` | `{}` | no |
| namespace\_annotations | Map of annotations to apply to the namespace. | `map` | `{}` | no |
| namespace\_labels | Map of labels to apply to the namespace. | `map` | `{}` | no |
| namespace\_name | Name of the namespace to create and deploy the nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to run in it's own namespace.\* | `string` | `"ingress-nginx"` | no |
| nginx\_configuration\_annotations | Map of annotations to apply to the nginx\_configuration config map. | `map` | `{}` | no |
| nginx\_configuration\_labels | Map of labels to apply to the nginx\_configuration config map. | `map` | `{}` | no |
| nginx\_configuration\_name | Name of the nginx\_configuration config map to create. | `string` | `"nginx-configuration"` | no |
| node\_selector | Map of key value that will be used to select appropriate nodes | `map` | <pre>{<br>  "kubernetes.io/os": "linux"<br>}</pre> | no |
| replicas | Number of replica's to deploy. | `number` | `3` | no |
| role\_annotations | Map of annotations to apply to the role. | `map` | `{}` | no |
| role\_binding\_annotations | Map of annotations to apply to the role binding. | `map` | `{}` | no |
| role\_binding\_labels | Map of labels to apply to the role binding. | `map` | `{}` | no |
| role\_binding\_name | Name of the role binding to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.\* | `string` | `"ingress-nginx"` | no |
| role\_labels | Map of labels to apply to the role. | `map` | `{}` | no |
| role\_name | Name of the role to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.\* | `string` | `"ingress-nginx"` | no |
| service\_account\_annotations | Map of annotations to apply to the service account. | `map` | `{}` | no |
| service\_account\_labels | Map of labels to apply to the service account. | `map` | `{}` | no |
| service\_account\_name | Name of the service account to create for nginx-ingress-controller. *Note: This is an opinianated choice of forcing the nginx-ingress-controller to use RBAC.\* | `string` | `"ingress-nginx"` | no |
| service\_annotations | Map of annotations to apply to the service. | `map` | `{}` | no |
| service\_external\_traffic\_policy | The external traffic policy for the service. | `string` | `"Local"` | no |
| service\_labels | Map of labels to apply to the service. | `map` | `{}` | no |
| service\_load\_balancer\_ip | IP address to be used for the service. | `string` | n/a | yes |
| service\_load\_balancer\_source\_ranges | List of source ranges that will be allowed access to the load balancer. | `list(string)` | n/a | yes |
| service\_name | Name of the service to create for nginx-ingress-controller. | `string` | `"ingress-nginx"` | no |
| service\_type | Type of service to create for the nginx-ingress-controller. | `string` | `"LoadBalancer"` | no |
| tcp\_services\_annotations | Map of annotations to apply to the tcp\_services config map. | `map` | `{}` | no |
| tcp\_services\_labels | Map of labels to apply to the tcp\_services config map. | `map` | `{}` | no |
| tcp\_services\_name | Name of the tcp\_services config map to create. | `string` | `"tcp-services"` | no |
| udp\_services\_annotations | Map of annotations to apply to the udp\_services config map. | `map` | `{}` | no |
| udp\_services\_labels | Map of labels to apply to the udp\_services config map. | `map` | `{}` | no |
| udp\_services\_name | Name of the udp\_services config map to create. | `string` | `"udp-services"` | no |

## Outputs

| Name | Description |
|------|-------------|
| deployment\_name | Name of the deployment created by this module. |
| namespace | Namespace in which the module is deployed. |
| nginx\_configuration\_name | Name of the nginx configuration config map created by this module. |
| service\_name | Name of the service created by this module. |
| tcp\_services\_name | Name of the tcp\_services config map created by this module. |
| udp\_services\_name | Name of the udp\_services config map created by this module. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
