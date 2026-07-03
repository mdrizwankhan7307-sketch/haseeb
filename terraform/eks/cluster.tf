#############################################
# Amazon EKS Cluster
#############################################

resource "aws_eks_cluster" "eks" {

  name = "student-eks"

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.33"

  vpc_config {

    subnet_ids = concat(
      aws_subnet.public[*].id,
      aws_subnet.private[*].id
    )

    endpoint_public_access = true

    endpoint_private_access = true

    security_group_ids = [

      aws_security_group.eks_cluster_sg.id

    ]

  }

  enabled_cluster_log_types = [

    "api",

    "audit",

    "authenticator"

  ]

  depends_on = [

    aws_iam_role_policy_attachment.eks_cluster_policy

  ]

  tags = {

    Environment = "Dev"

    Project = "Student-App"

  }

}
