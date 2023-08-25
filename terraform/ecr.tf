# Create ECR repository

resource "aws_ecr_repository" "ecr" {
  name = var.ecr_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Terraform = "True"
  }
}

# Output ECR repository url

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

