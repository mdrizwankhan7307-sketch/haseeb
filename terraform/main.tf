#############################################
# Networking Module
#############################################

module "networking" {

  source = "./networking"

}

#############################################
# IAM Module
#############################################

module "iam" {

  source = "./iam"

}

#############################################
# Security Module
#############################################

module "security" {

  source = "./security"

  vpc_id   = module.networking.vpc_id
  vpc_cidr = "10.0.0.0/16"

}

#############################################
# ECR Module
#############################################

module "ecr" {

  source = "./ecr"

}

#############################################
# CloudWatch Module
#############################################

module "cloudwatch" {

  source = "./cloudwatch"

}

#############################################
# Secrets Manager Module
#############################################

module "secret_manager" {

  source = "./secret-manager"

  db_username = "admin"
  db_password = "Student@123"

}

#############################################
# RDS Module
#############################################

module "rds" {

  source = "./rds"

  private_subnet_ids    = module.networking.private_subnet_ids
  rds_security_group_id = module.security.rds_security_group_id

  password = "Student@123"

}

#############################################
# EKS Module
#############################################

module "eks" {

  source = "./eks"

  cluster_name    = "student-eks"
  cluster_version = "1.33"

  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids

  cluster_security_group_id = module.security.cluster_security_group_id

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  node_group_name = "student-node-group"

  instance_types = [
    "t3.medium"
  ]

  desired_size = 2
  min_size     = 2
  max_size     = 4

}
