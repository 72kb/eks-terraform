module "vpc" {
  source       = "./modules/vpc"
  name         = var.name
  environment  = var.environment
  subnet_count = var.subnet_count

}

module "my_security_groups" {
  source         = "./modules/security_groups"
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
  name           = var.name
  environment    = var.environment
}

module "vpc_endpoints" {
  source            = "./modules/vpc_endpoints"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.vpc.vpc_default_security_group_id
  subnet_ids_eks    = [for count in range(length(module.vpc.subnets)) : module.vpc.subnets[count].id if count < var.subnet_count && count < module.vpc.az_list]
}

module "cwlogs" {
  source      = "./modules/cwlogs"
  name        = var.name
  environment = var.environment
}

module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"

  subnets = module.vpc.subnet_ids
  vpc_id  = module.vpc.vpc_id

  # eks_iam_role_arn = module.iam.eks_role.arn
  node_group_name = "my-nodegroups"
  instance_type   = "t2.micro"
}

# module "iam" {
#   source = "./iam"  # Replace with the actual path to your module

#   iam_user_name   = "my-eks-user"
#   iam_role_name   = "my-eks-role"
#   attach_policies = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
# }