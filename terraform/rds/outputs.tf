output "rds_endpoint" {

  value = aws_db_instance.student_mysql.endpoint

}

output "database_name" {

  value = aws_db_instance.student_mysql.db_name

}
