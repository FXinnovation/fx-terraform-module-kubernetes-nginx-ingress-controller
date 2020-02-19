#####
# Providers
#####

provider "azuread" {
  version         = "0.4.0"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "azurerm" {
  version         = "1.28.0"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "random" {
  version = "~> 2"
}

provider "kubernetes" {
  version                = "1.10.0"
  host                   = module.aks_cluster.kube_config.0.host
  username               = module.aks_cluster.kube_config.0.username
  password               = module.aks_cluster.kube_config.0.password
  client_certificate     = base64decode(module.aks_cluster.kube_config.0.client_certificate)
  client_key             = base64decode(module.aks_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(module.aks_cluster.kube_config.0.cluster_ca_certificate)
}

#####
# Randoms
#####

resource "random_string" "default" {
  upper   = false
  number  = false
  special = false
  length  = 8
}

#####
# Context
#####

module "aks_cluster" {
  source = "git::https://git@scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-aks.git?ref=0.1.0"

  resource_group_name                   = random_string.default.result
  location                              = "canadacentral"
  name                                  = random_string.default.result
  kubernetes_version                    = "1.14.8"
  dns_prefix                            = "kubernetes"
  log_analytics_workspace_name          = random_string.default.result
  log_analytics_workspace_sku           = "free"
  log_analytics_workspace_retentionDays = 30
  rbac_enabled                          = true
  agent_pool_profiles = [
    {
      name            = "tftestaks"
      count           = 1
      vm_size         = "Standard_D2_v2"
      os_type         = "Linux"
      os_disk_size_gb = 30
    }
  ]
}

#####
# default example
#####

module "default" {
  source = "../.."

  namespace_name = random_string.default.result
}
