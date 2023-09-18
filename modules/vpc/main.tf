data "aws_availability_zones" "available" {
}

resource "aws_vpc" "main" {
  enable_dns_hostnames = true
  enable_dns_support   = true
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name}-vpc-${var.environment}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones) * var.subnet_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

  tags = {
    Name = "${var.name}-private-subnet-${count.index + 1}-${var.environment}"
  }
}


resource "aws_security_group" "vpc_default" {
  name   = "${var.name}-vpc-default-sg-${var.environment}"
  vpc_id = aws_vpc.main.id
}