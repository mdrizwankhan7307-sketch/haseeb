#############################################
# IAM Variables
#############################################

variable "cluster_role_name" {

  description = "EKS Cluster Role"

  type = string

  default = "student-eks-cluster-role"

}

variable "node_role_name" {

  description = "EKS Node Role"

  type = string

  default = "student-eks-node-role"

}

variable "environment" {

  description = "Environment"

  type = string

  default = "Dev"

}
