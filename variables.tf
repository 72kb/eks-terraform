variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  type        = list(string)
}

variable "name" {
  description = "Name of the VPC and ECR repository"
  default     = "my-vpc"
}

variable "environment" {
  description = "Environment name"
  default     = "dev"
}

variable "subnet_count" {
  description = "Number of private subnets per availability zone"
  default     = 3
}

variable "subnet_bits" {
  description = "Number of bits for subnetting"
  default     = 8
}

variable "container_port" {
  description = "Port exposed by the ECS task"
  default     = 8080
}

variable "ecr_name" {
  description = "Name of the ECR repository"
  default     = "my-ecr-repo"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "eks-cluster"
}

variable "cluster_version" {
  description = "EKS cluster version"
  default     = "1.21"
  type        = string
}

