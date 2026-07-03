#############################################
# CloudWatch Variables
#############################################

variable "log_group_name" {

  description = "CloudWatch Log Group Name"

  type = string

  default = "/aws/eks/student-eks/cluster"

}

variable "retention_days" {

  description = "Log Retention Period"

  type = number

  default = 30

}

variable "environment" {

  description = "Environment"

  type = string

  default = "Dev"

}
