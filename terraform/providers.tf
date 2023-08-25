# Configure Terraform providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }
}


# Configure the AWS Provider

provider "aws" {
  region = var.region
}

# Configure Kubernetes Provider

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster_ca_cert)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

# Configure Helm Provider

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster_ca_cert)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
