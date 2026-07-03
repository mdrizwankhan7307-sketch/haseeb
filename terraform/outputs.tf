#############################################
# EKS Outputs
#############################################

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate" {
  value = module.eks.cluster_certificate
}

output "node_group_name" {
  value = module.eks.node_group_name
}

#############################################
# ECR Outputs
#############################################

output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

#############################################
# RDS Outputs
#############################################

output "db_endpoint" {
  value = module.rds.db_instance_endpoint
}

#############################################
# Secrets Manager
#############################################

output "secret_arn" {
  value = module.secret_manager.secret_arn
}

#############################################
# CloudWatch
#############################################

output "log_group_name" {
  value = module.cloudwatch.log_group_name
}
