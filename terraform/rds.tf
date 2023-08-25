# Create RDS database instance 

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

# Output RDS database endpoint (address:port)

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

