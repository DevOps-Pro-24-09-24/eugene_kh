variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnet_id" {
  description = "Public subnet ID"
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

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
