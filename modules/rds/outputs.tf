output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_identifier" {
  description = "RDS DB identifier"
  value       = aws_db_instance.this.id
} 