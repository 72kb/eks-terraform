output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Logs log group for EKS cluster"
  value       = aws_cloudwatch_log_group.eks_cluster.name
}
