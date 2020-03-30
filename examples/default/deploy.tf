#####
# Providers
#####

provider "random" {
  version = "~> 2"
}

provider "kubernetes" {
  version          = "1.10.0"
  load_config_file = true
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
# default example
#####

module "default" {
  source = "../.."

  namespace_name = random_string.default.result
}
