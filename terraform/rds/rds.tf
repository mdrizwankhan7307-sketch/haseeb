############################################
# RDS Subnet Group
############################################

resource "aws_db_subnet_group" "student_db_subnet" {

  name = "student-db-subnet-group"

  subnet_ids = aws_subnet.private[*].id

  tags = {

    Name = "student-db-subnet-group"

  }

}

############################################
# MySQL Parameter Group
############################################

resource "aws_db_parameter_group" "mysql" {

  name   = "student-mysql-parameter-group"

  family = "mysql8.0"

  tags = {

    Name = "student-mysql-parameter-group"

  }

}

############################################
# MySQL RDS Instance
############################################

resource "aws_db_instance" "student_mysql" {

  identifier = "student-mysql-db"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  storage_encrypted = true

  username = var.db_username

  password = var.db_password

  db_name = var.db_name

  port = 3306

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  deletion_protection = false

  db_subnet_group_name = aws_db_subnet_group.student_db_subnet.name

  parameter_group_name = aws_db_parameter_group.mysql.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  backup_retention_period = 7

  backup_window = "02:00-03:00"

  maintenance_window = "Sun:03:00-Sun:04:00"

  tags = {

    Name = "student-mysql"

    Environment = "Dev"

    Project = "Student-App"

  }

}
