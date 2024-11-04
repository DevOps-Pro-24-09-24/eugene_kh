terraform {
  backend "s3" {
    bucket         = "hw-6"
    key            = "hw-6/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "hw-6"
    encrypt        = true
  }
}
