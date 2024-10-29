variable "region" {}
variable "instance_size" {}
variable "base_ami" {}

source "amazon-ebs" "db" {
  region           = var.region
  source_ami       = var.base_ami
  instance_type    = var.instance_size
  ami_name         = "db-ami"
  ssh_username     = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.db"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y mysql-server",
      "sudo mysql -e \"CREATE DATABASE app_db;\"",
      "sudo mysql -e \"CREATE USER 'app_user'@'%' IDENTIFIED BY 'password';\"",
      "sudo mysql -e \"GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'%';\""
    ]
  }
}
