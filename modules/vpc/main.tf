resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(var.tags, {"Name" = "main_vpc"})
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = merge(var.tags, {"Name" = "public_subnet_${count.index}"})
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = merge(var.tags, {"Name" = "private_subnet_${count.index}"})
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.main.id
  tags = merge(var.tags, {"Name" = "alb_sg"})
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.main.id
  tags = merge(var.tags, {"Name" = "ec2_sg"})
}
