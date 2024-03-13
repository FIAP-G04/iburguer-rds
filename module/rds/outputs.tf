output "rds_db_user" {
  value = aws_db_instance.rds.username
}

output "rds_db_name" {
  value = aws_db_instance.rds.db_name
}

output "rds_db_host" {
  value = aws_db_instance.rds.address
}