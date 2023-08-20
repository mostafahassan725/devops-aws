# This is the main terraform file
# where RDS, ECR, EKS, ALB are created
# Usage: []=optional
# terraform init
# terraform fmt
# terraform validate
# terraform plan [-var-file=terraform.tfvars]
# terraform apply [-auto-approve] [-var-file=terraform.tfvars]

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}


# Configure the AWS Provider

provider "aws" {
  region = var.region
}

# RDS database instance 

resource "aws_db_instance" "db" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot

  tags = {
    Terraform = "True"
  }
}

# ECR repository

resource "aws_ecr_repository" "ecr" {
  name = var.ecr_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Terraform = "True"
  }
}

# IAM Role for EKS

resource "aws_iam_role" "eks" {
  name               = var.eks_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = {
    Terraform = "True"
  }
}

# IAM Policy attachment for EKS

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = var.iam_role_policy_arn
  role       = aws_iam_role.eks.name
}

# EKS cluster

resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = [data.aws_subnets.public.ids[0], data.aws_subnets.public.ids[1]]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
  ]

  tags = {
    Terraform = "True"
    Helm      = "True"
  }
}

# ALB for EKS

resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = var.load_balancer_type

  tags = {
    Terraform = "True"
  }
}
