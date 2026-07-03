#############################################
# EKS Cluster Variables
#############################################

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "student-eks"
}

variable "cluster_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.33"
}

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Cluster Security Group"
  type        = string
}

variable "cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  type        = string
}

variable "node_role_arn" {
  description = "Node Group IAM Role ARN"
  type        = string
}

#############################################
# Node Group Variables
#############################################

variable "node_group_name" {
  description = "Node Group Name"
  type        = string
  default     = "student-node-group"
}

variable "instance_types" {
  description = "EC2 Instance Types"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Capacity Type"
  type        = string
  default     = "ON_DEMAND"
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "project" {
  type    = string
  default = "Student-App"
}
