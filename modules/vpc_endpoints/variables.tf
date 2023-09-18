variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group allowing ECR traffic"
  type        = string
}

variable "subnet_ids_eks" {
  description = "List of subnet IDs"
  type        = list(any)
}
