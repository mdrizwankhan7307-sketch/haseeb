#############################################
# DB Subnet Group
#############################################

resource "aws_db_subnet_group" "rds_subnet_group" {

  name       = var.db_subnet_group_name
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

#############################################
# RDS MySQL Instance
#############################################

resource "aws_db_instance" "mysql" {

  identifier = var.db_identifier

  engine         = "mysql"
  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp2"

  db_name  = var.database_name
  username = var.username
  password = var.password

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  tags = {

    Name        = var.db_identifier
    Environment = var.environment

  }

}
