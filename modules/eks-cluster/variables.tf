variable "instance_type" {
  description = "Instance type"
}

variable "cluster_name" {
  description = "cluster-name"
}

variable "cluster_version" {
  description = "cluster-eks"
}

variable "subnets" {
  description = "List of subnet IDs where EKS nodes will be launched."
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster will be created."
}

variable "node_group_name" {
  description = "nodegroups-name"
}

# variable "role_arn" {
#   description = iam_role_arn
# }
