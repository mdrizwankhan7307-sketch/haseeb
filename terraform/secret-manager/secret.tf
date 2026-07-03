#############################################
# AWS Secrets Manager Secret
#############################################

resource "aws_secretsmanager_secret" "db_secret" {

  name        = var.secret_name
  description = "Database Credentials"

  tags = {
    Name        = var.secret_name
    Environment = var.environment
  }
}

#############################################
# Secret Value
#############################################

resource "aws_secretsmanager_secret_version" "db_secret_value" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({

    username = var.db_username
    password = var.db_password

  })

}
