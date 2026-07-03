#############################################
# RDS Outputs
#############################################

output "db_instance_endpoint" {

  value = aws_db_instance.mysql.endpoint

}

output "db_instance_address" {

  value = aws_db_instance.mysql.address

}

output "db_instance_identifier" {

  value = aws_db_instance.mysql.id

}

output "db_name" {

  value = aws_db_instance.mysql.db_name

}
