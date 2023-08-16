# RDS database endpoint (address:port)

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

# EKS cluster endpoint

output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
