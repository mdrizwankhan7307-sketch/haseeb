#############################################
# EKS Cluster Security Group
#############################################

resource "aws_security_group" "eks_cluster_sg" {

  name        = var.cluster_sg_name
  description = "Security Group for EKS Cluster"
  vpc_id      = var.vpc_id

  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
      var.vpc_cidr
    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {

    Name = var.cluster_sg_name

  }

}

#############################################
# Worker Node Security Group
#############################################

resource "aws_security_group" "worker_node_sg" {

  name        = var.worker_sg_name
  description = "Worker Node Security Group"
  vpc_id      = var.vpc_id

  ingress {

    from_port = 0
    to_port   = 65535
    protocol  = "tcp"

    security_groups = [
      aws_security_group.eks_cluster_sg.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {

    Name = var.worker_sg_name

  }

}

#############################################
# RDS Security Group
#############################################

resource "aws_security_group" "rds_sg" {

  name        = var.rds_sg_name
  description = "RDS Security Group"
  vpc_id      = var.vpc_id

  ingress {

    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    security_groups = [
      aws_security_group.worker_node_sg.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {

    Name = var.rds_sg_name

  }

}
