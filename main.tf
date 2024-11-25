provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
  tags                = { "hw-7" = "Website" }
}

module "rds" {
  source              = "./modules/rds"
  db_identifier       = "mydb-instance"
  db_name             = "website_db"
  db_username         = "admin"
  db_password         = "password"
  db_subnet_group_name = module.vpc.db_subnet_group_name
  vpc_security_group_ids = [module.vpc.rds_security_group.id]
  tags                = { "hw-7" = "Website" }
}

module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  ami_id             = "ami-0084a47cc718c111a"
  instance_type      = "t2.micro"
  key_name           = "Main"
  user_data          = file("wordpress_user_data.sh")
  tags               = { "hw-7" = "Website" }
}

module "alb" {
  source              = "./modules/alb"
  alb_security_group_id = module.vpc.alb_security_group_id
  subnet_ids          = module.vpc.public_subnet_ids
  ssl_certificate_arn = "arn:aws:acm:eu-central-1:940482411138:certificate/2b46a5f6-fcd1-436c-809e-109976e5cad7"
  tags                = { "hw-7" = "Website" }
}
