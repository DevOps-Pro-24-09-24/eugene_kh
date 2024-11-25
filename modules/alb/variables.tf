variable "alb_security_group_id" {
  description = "ALB security group ID"
}

variable "subnet_ids" {
  description = "Subnets for the ALB"
  type        = list(string)
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
