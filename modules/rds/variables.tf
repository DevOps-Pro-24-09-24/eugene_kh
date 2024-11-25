variable "db_identifier" {
  description = "Identifier for the RDS database"
}

variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
