variable "region" {

  default = "us-east-1"

}

variable "vpc_cidr" {

  default = "10.0.0.0/16"

}

variable "public_subnets" {

  default = [

    "10.0.1.0/24",

    "10.0.2.0/24",

    "10.0.3.0/24"

  ]

}

variable "private_subnets" {

  default = [

    "10.0.4.0/24",

    "10.0.5.0/24",

    "10.0.6.0/24"

  ]

}

#############################################
# RDS Variables
#############################################

variable "db_username" {

  description = "RDS Username"

  type = string

  default = "admin"

}

variable "db_password" {

  description = "RDS Password"

  type = string

  sensitive = true

}

variable "db_name" {

  description = "Database Name"

  type = string

  default = "studentdb"

}
