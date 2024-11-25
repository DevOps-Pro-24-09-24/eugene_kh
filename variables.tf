variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "user_data" {
  description = "User data for configuring the server"
  type        = string
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate"
}

variable "db_identifier" {
  description = "RDS Database identifier"
}

variable "db_name" {
  description = "RDS Database name"
}

variable "db_username" {
  description = "RDS Database username"
}

variable "db_password" {
  description = "RDS Database password"
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALB security group ID"
}

variable "subnet_ids" {
  description = "Subnets for the ALB"
  type        = list(string)
}

