resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = var.vpc_id
  tags = merge(var.tags, {"Name" = "web_sg"})
}

resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  security_group_ids     = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true
  user_data              = var.user_data
  tags                   = merge(var.tags, {"Name" = "web_server"})

  lifecycle {
    create_before_destroy = true
  }
}
