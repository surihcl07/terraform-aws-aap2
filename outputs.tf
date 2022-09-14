output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}


# RDS output vaules
output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.aap2.address  
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.aap2.port  
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.aap2.username  
}

output "rds_security_group_id" {
  description = "RDS instance security group"
  value = aws_db_instance.aap2.vpc_security_group_ids
  
}

# ECR section

output "registry_name" {
  description = "ECR resgistry now"
  value = aws_ecr_repository.aap2_ecr_repo.name  
}

