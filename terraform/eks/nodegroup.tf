#############################################
# Managed Node Group
#############################################

resource "aws_eks_node_group" "node_group" {

  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  instance_types = var.instance_types

  capacity_type = var.capacity_type

  scaling_config {

    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  update_config {

    max_unavailable = 1
  }

  tags = {

    Name        = var.node_group_name
    Environment = var.environment
  }
}
