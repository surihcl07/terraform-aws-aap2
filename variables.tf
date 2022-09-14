variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "environment" {
  description = "AWS environment"
  type = string
  default = "test"
}

# variables for RDS Postgres DB
variable "db_password" {
  description = "RDS root user password"
  default = "postgres"
  sensitive   = true
}
variable "db_username" {
  description = "RDS root user"
  default = "postgres"
}

# ECR variables
variable "ecr_name"{
  description = "ECR name"
  type        = string
  default     = "aap2-ecr"

}