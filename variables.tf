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

# EC2 instance variables
variable "ami" {
    description = "RHEL 5 AMI"
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    description = "Instance type"
    default = "t2.micro"
  
}


variable "vm_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "vm_root_volume_size" {
  type        = number
  description = "Root Volume size of the EC2 Instance"
}
variable "vm_data_volume_size" {
  type        = number
  description = "Data volume size of the EC2 Instance"
}
variable "vm_root_volume_type" {
  type        = string
  description = "Root volume type of the EC2 Instance"
  default     = "gp2"
}
variable "vm_data_volume_type" {
  type        = string
  description = "Data volume type of the EC2 Instance"
  default     = "gp2"
}

variable "aap2_instace_count" {
    type = number
    description = "Number Instances to deploy for AAP2 controller"
    default = 3
  
}

variable "bastion_instace_count" {
    type = number
    description = "Number Instances to deploy for AAP2 controller"
    default = 1
  
}