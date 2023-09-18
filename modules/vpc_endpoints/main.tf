resource "aws_vpc_endpoint" "eks-api-endpoint" {
  vpc_id      = var.vpc_id
  service_name = "com.amazonaws.${data.aws_region.current.name}.eks"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  security_group_ids = [var.security_group_id]
}


data "aws_region" "current" {}
