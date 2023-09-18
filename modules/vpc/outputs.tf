output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_default_security_group_id" {
  value = aws_security_group.vpc_default.id
}

output "subnet_ids" {
  description = "List of subnet IDs created in the VPC"
  value       = aws_subnet.private[*].id
}

output "subnets" {
  description = "Outputs the private subnets"
  value       = aws_subnet.private
}

output "az_list" {
  description = "Outputs the AZ list"
  value       = length(data.aws_availability_zones.available.names)
}

output "private_subnets_ids" {
  description = "List of private subnet IDs created in the VPC"
  value       = [for subnet in aws_subnet.private : subnet.id]
}