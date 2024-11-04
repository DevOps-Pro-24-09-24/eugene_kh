output "web_instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "db_instance_private_ip" {
  value = aws_instance.db.private_ip
}

output "web_instance_dns" {
  value = aws_instance.web.public_dns
}
