#############################################
# Security Group for EKS Control Plane
#############################################

resource "aws_security_group" "eks_cluster_sg" {

  name        = "student-eks-cluster-sg"
  description = "Security Group for EKS Cluster"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "student-eks-cluster-sg"
  }

}

#############################################
# Security Group for Worker Nodes
#############################################

resource "aws_security_group" "worker_node_sg" {

  name        = "student-worker-node-sg"
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port = 0
    to_port   = 65535
    protocol  = "tcp"

    self = true

  }

  ingress {

    from_port = 443
    to_port   = 443
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
    Name = "student-worker-node-sg"
  }

}

#############################################
# Security Group for RDS MySQL
#############################################

resource "aws_security_group" "rds_sg" {

  name        = "student-rds-sg"
  description = "Security Group for MySQL"
  vpc_id      = aws_vpc.main.id

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
    Name = "student-rds-sg"
  }

}

#############################################
# Security Group for ALB
#############################################

resource "aws_security_group" "alb_sg" {

  name        = "student-alb-sg"
  description = "Security Group for Application Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
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
    Name = "student-alb-sg"
  }

}
