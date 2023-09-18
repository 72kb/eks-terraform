variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the ECS task"
  default     = 8080  # Provide a default value here or adjust it as needed
  type        = number
}

variable "name" {
  description = "Name for the security group"
  default     = "my-security-group"  # Provide a default name or adjust it as needed
  type        = string
}

variable "environment" {
  description = "Environment name"
  default     = "dev"  # Provide a default environment name or adjust it as needed
  type        = string
}
