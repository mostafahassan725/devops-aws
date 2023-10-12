terraform {
  source = "github.com/mostafahassan725/terraform-modules//services/ecr?ref=ecr-v0.0.3"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  tags = read_terragrunt_config(find_in_parent_folders("tags.hcl"))
}

inputs = {

  ecr_name             = "docker-repo"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name      = "docker-repo"
    env       = local.tags.locals.env
    managedby = local.tags.locals.managedby
  }
}
