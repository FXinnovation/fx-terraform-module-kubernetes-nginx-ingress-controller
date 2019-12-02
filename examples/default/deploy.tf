provider "aws" {
  version    = "~> 2.27.0"
  region     = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "random" {
  version = "~> 2.0"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.this.token
  load_config_file       = false
  version                = "~> 1.9"
}

data "aws_eks_cluster_auth" "this" {
  name = "fxinnovation-validation-cluster"
}

data "aws_eks_cluster" "this" {
  name = "fxinnovation-validation-cluster"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.default.id
}

resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

module "default" {
  source = "../../"

  providers = {
    kubernetes = kubernetes
  }

  namespace_name = "nginx-ingress-${random_string.this.result}"

  node_selector = {}
}
