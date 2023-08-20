# RDS database endpoint (address:port)

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

# EKS cluster endpoint

output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

# ECR repository url

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

# ALB id and dns

output "alb_id" {
  value = aws_lb.alb.id
}

output "alb_dns" {
  value = aws_lb.alb.dns_name
}
