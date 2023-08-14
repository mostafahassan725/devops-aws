# AWS Provider variables

variable "region" {
  description = "The region to provision resources in"
  type        = string
}

# RDS variables

variable "allocated_storage" {
  description = "The database allocated storage"
  type        = number
}
variable "db_name" {
  description = "The database name"
  type        = string
}
variable "engine" {
  description = "The database engine"
  type        = string
}
variable "engine_version" {
  description = "The database engine version"
  type        = string
}
variable "instance_class" {
  description = "the database instance class (usually t2.micro)"
}
variable "username" {
  description = "The database username"
  type        = string
}
variable "password" {
  description = "The database password"
  type        = string
}
variable "parameter_group_name" {
  description = "The associated parameter group for the database (default configuration settings for this group)"
  type        = string
}
variable "skip_final_snapshot" {
  description = "Skip final snapshot when the database is deleted"
  type        = bool
}

# ECR repository variables

variable "ecr_name" {
  description = "ECR repository name"
  type        = string
}
variable "scan_on_push" {
  description = "The scan on push configuration for the images in the ecr repository"
  type        = bool
}
