variable "region" {}
variable "instance_size" {}
variable "base_ami" {}

source "amazon-ebs" "app" {
  region           = var.region
  source_ami       = var.base_ami
  instance_type    = var.instance_size
  ami_name         = "app-ami"
  ssh_username     = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.app"]

#  provisioner "shell" {
#    inline = [
#      "sudo apt-get update",
#      "sudo apt-get install -y python3-pip",
#      "pip3 install -r /home/ev/eugene_kholodniak/packer/examples/flask-alb-app/requirements.txt"
#    ]
#  }
}
