# Create IAM Role for EKS

resource "aws_iam_role" "eks" {
  name               = var.eks_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = {
    Terraform = "True"
  }
}

# Create IAM Policy attachment for EKS

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = var.iam_role_policy_arn
  role       = aws_iam_role.eks.name
}

# Create EKS cluster

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

# Retrieve the default VPC in the provider region

data "aws_vpc" "default" {
  default = true
}

# Retrieve all the public subnets inside the default VPC

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}


# Retrieve IAM Policy document for access allow to EKS

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Retrieve cluster endpoint

data "aws_eks_cluster" "cluster_endpoint" {
  name       = aws_eks_cluster.eks.endpoint
  depends_on = [aws_eks_cluster.eks]
}

# Retrieve encoded cluster CA certification

data "aws_eks_cluster" "cluster_ca_cert" {
  name       = aws_eks_cluster.eks.certificate_authority[0].data
  depends_on = [aws_eks_cluster.eks]
}

