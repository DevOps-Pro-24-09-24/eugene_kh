resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "hw-6"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.0.0/25"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1"
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.0.128/25"
  availability_zone = "eu-central-1"
  tags = {
    Name = "Private Subnet"
  }
}
