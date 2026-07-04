#############################################
# Networking Module
#############################################

module "networking" {

  source = "./networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnets
  private_subnet_cidrs = var.private_subnets
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
  vpc_cidr = var.vpc_cidr

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

  db_username = var.db_username
  db_password = var.db_password

}

#############################################
# RDS Module
#############################################

module "rds" {

  source = "./rds"

  private_subnet_ids    = module.networking.private_subnet_ids
  rds_security_group_id = module.security.rds_security_group_id

  password = var.db_password

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
    "t2.micro"
  ]

  desired_size = 1
  min_size     = 1
  max_size     = 1

}
