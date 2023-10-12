terraform {
  source = "github.com/mostafahassan725/terraform-modules//data-stores/rds?ref=rds-v0.0.3"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  tags = read_terragrunt_config(find_in_parent_folders("tags.hcl"))
}

inputs = {

  # subnet group specific variables
  subnet_group_name = "mydb-subnet-group"
  subnet_ids        = dependency.subnets.outputs.private_subnets_ids

  # rds specific variables
  allocated_storage    = 10
  db_name              = "${local.tags.locals.env}db"
  az                   = "eu-west-3a"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_username          = get_env("MYSQL_DB_USERNAME")
  db_password          = get_env("MYSQL_DB_PASSWORD")
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  # tags
  tags = {
    env       = local.tags.locals.env
    managedby = local.tags.locals.managedby
  }

}

dependency "subnets" {
  config_path = "../../vpc"
  mock_outputs = {
    private_subnets_ids = ["subnet-fake1", "subnet-fake2"]
  }
}
