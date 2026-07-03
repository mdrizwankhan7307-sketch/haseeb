#############################################
# Managed Node Group
#############################################

resource "aws_eks_node_group" "node_group" {

  cluster_name = aws_eks_cluster.eks.name

  node_group_name = "student-node-group"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = aws_subnet.private[*].id

  instance_types = [

    "t3.medium"

  ]

  capacity_type = "ON_DEMAND"

  scaling_config {

    desired_size = 2

    min_size = 2

    max_size = 4

  }

  update_config {

    max_unavailable = 1

  }

  depends_on = [

    aws_iam_role_policy_attachment.worker_node_policy,

    aws_iam_role_policy_attachment.cni_policy,

    aws_iam_role_policy_attachment.ecr_policy

  ]

  tags = {

    Name = "student-node-group"

  }

}
