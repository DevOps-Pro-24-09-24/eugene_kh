resource "aws_db_instance" "main" {
  identifier = var.db_identifier
  engine     = "mysql"
  username   = var.db_username
  password   = var.db_password
  db_name    = var.db_name
  instance_class = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "gp2"
  multi_az          = false
  publicly_accessible = false
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = merge(var.tags, {"Name" = "db_instance"})
}
