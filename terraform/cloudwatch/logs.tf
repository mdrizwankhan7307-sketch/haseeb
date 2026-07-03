#############################################
# CloudWatch Log Group for EKS
#############################################

resource "aws_cloudwatch_log_group" "eks_logs" {

  name              = var.log_group_name
  retention_in_days = var.retention_days

  tags = {

    Name        = var.log_group_name
    Environment = var.environment

  }

}
