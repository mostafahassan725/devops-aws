# ALB for EKS

resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = var.load_balancer_type

  tags = {
    Terraform = "True"
  }
}

# Output ALB ID

output "alb_id" {
  value = aws_lb.alb.id
}

# Output ALB DNS

output "alb_dns" {
  value = aws_lb.alb.dns_name
}

