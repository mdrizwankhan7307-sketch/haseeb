#############################################
# Secrets Manager Variables
#############################################

variable "secret_name" {

  description = "Secrets Manager Secret Name"

  type = string

  default = "student-rds-secret"

}

variable "db_username" {

  description = "Database Username"

  type = string

  default = "admin"

}

variable "db_password" {

  description = "Database Password"

  type      = string
  sensitive = true

}

variable "environment" {

  description = "Environment"

  type = string

  default = "Dev"

}
