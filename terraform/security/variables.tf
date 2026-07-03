#############################################
# Security Variables
#############################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

variable "vpc_cidr" {

  description = "VPC CIDR"

  type = string

}

variable "cluster_sg_name" {

  type = string

  default = "student-eks-cluster-sg"

}

variable "worker_sg_name" {

  type = string

  default = "student-worker-node-sg"

}

variable "rds_sg_name" {

  type = string

  default = "student-rds-sg"

}
