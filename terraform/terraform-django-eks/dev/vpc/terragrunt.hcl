terraform {
  source = "github.com/mostafahassan725/terraform-modules//vpc?ref=vpc-v0.0.6"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  tags = read_terragrunt_config(find_in_parent_folders("tags.hcl"))
}

inputs = {

  # VPC specific variables
  enable_dns_hostnames = true

  # subnets specific variables
  public_subnets_cidr_blocks  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets_cidr_blocks = ["10.0.2.0/24", "10.0.4.0/24"]
  azs                         = ["eu-west-3a", "eu-west-3b"]

  public_subnets_tags = {
    "kubernetes.io/role/elb"                   = 1
    "kubernetes.io/cluster/dev-django-cluster" = "owned"
  }

  private_subnets_tags = {
    "kubernetes.io/role/internal-elb"          = 1
    "kubernetes.io/cluster/dev-django-cluster" = "owned"
  }

  tags = {
    env       = local.tags.locals.env
    managedby = local.tags.locals.managedby
  }

}
