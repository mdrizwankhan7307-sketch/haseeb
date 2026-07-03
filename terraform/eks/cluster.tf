#############################################
# Amazon EKS Cluster
#############################################

resource "aws_eks_cluster" "eks" {

  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {

    subnet_ids = concat(
      var.public_subnet_ids,
      var.private_subnet_ids
    )

    endpoint_public_access  = true
    endpoint_private_access = true

    security_group_ids = [
      var.cluster_security_group_id
    ]
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator"
  ]

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}
