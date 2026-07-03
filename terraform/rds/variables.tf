#############################################
# RDS Variables
#############################################

variable "db_identifier" {

  type    = string
  default = "student-mysql"

}

variable "database_name" {

  type    = string
  default = "studentdb"

}

variable "username" {

  type    = string
  default = "admin"

}

variable "password" {

  type      = string
  sensitive = true

}

variable "engine_version" {

  type    = string
  default = "8.0"

}

variable "instance_class" {

  type    = string
  default = "db.t3.micro"

}

variable "allocated_storage" {

  type    = number
  default = 20

}

variable "db_subnet_group_name" {

  type    = string
  default = "student-db-subnet-group"

}

variable "private_subnet_ids" {

  type = list(string)

}

variable "rds_security_group_id" {

  type = string

}

variable "environment" {

  type    = string
  default = "Dev"

}
