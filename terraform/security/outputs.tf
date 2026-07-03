#############################################
# Security Outputs
#############################################

output "cluster_security_group_id" {

  value = aws_security_group.eks_cluster_sg.id

}

output "worker_security_group_id" {

  value = aws_security_group.worker_node_sg.id

}

output "rds_security_group_id" {

  value = aws_security_group.rds_sg.id

}
