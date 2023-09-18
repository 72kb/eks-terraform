output "test1" {
  description = "Output for application load balancer DNS name"
  value       = [for count in range(length(module.vpc.subnets)) : module.vpc.subnets[count].id if count < var.subnet_count && count < module.vpc.az_list]
}
