#############################################
# Secrets Manager Outputs
#############################################

output "secret_arn" {

  value = aws_secretsmanager_secret.db_secret.arn

}

output "secret_name" {

  value = aws_secretsmanager_secret.db_secret.name

}

output "secret_id" {

  value = aws_secretsmanager_secret.db_secret.id

}
