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

# ECR repository variables

variable "ecr_name" {
  description = "ECR repository name"
  type        = string
}

# IAM Role for EKS variables

variable "eks_iam_role_name" {
  description = "iam role for eks"
  type        = string
}

# IAM Role policy attachment

variable "iam_role_policy_arn" {
  description = "iam policy attachment arn"
  type        = string
}

# EKS variables

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

# ALB variables

variable "alb_name" {
  description = "ALB name"
  type        = string
}
variable "load_balancer_type" {
  description = "load balancer type either application or network"
  type        = string
}
