# RDS database endpoint (address:port)

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}
