# Home Work 7

# Raising a website on an AWS resource with an RDS database

To create an infrastructure with a public WordPress site and an RDS database with HTTPS access in AWS using Terraform, we will divide the configuration into several modules.

### We will use:

* VPC Module - for creating a VPC with public and private subnets.
* EC2 Module - for creating an EC2 instance for website hosting.
* RDS Module - for creating an RDS database (for example, MySQL or PostgreSQL).
* ALB Module - for creating a load balancer that provides access to the site via HTTPS.
* Security Groups - to create appropriate security groups.
* We will also add tags to all resources to simplify management.

### How does this work:

### Creating a Project Directory:

```
terraform_project/
├── main.tf
├── variables.tf
├── outputs.tf
├── wordpress_user_data.sh
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── rds/
│   └── alb/
├── terraform.tfvars
```

### We create modules:

* Creating a VPC module: modules/vpc/main.tf + variables.tf
* Creating an EC2 module: modules/ec2/main.tf + variables.tf
* Creating an RDS module: modules/rds/main.tf + variables.tf
* Creating an ALB module: modules/alb/main.tf + variables.tf

### Create user Data script for EC2 to initialize a server with WordPress:
* wordpress_user_data.sh

### Obtaining an SSL Certificate (ARN for HTTPS):
In order for your site to use HTTPS, you need to obtain an SSL certificate using AWS Certificate Manager (ACM).

### Go to the directory with your configuration files:

### Initialize Terraform:

```
terraform init
```

### Check your configuration:

```
terraform validate
```

### View the deployment plan:

```
terraform plan
```

### Apply changes:

```
terraform apply
```

### Once the configuration is applied, verify that all resources were successfully created in the AWS console, to check the functionality of a web resource, you need to log into the AWS console.

### Go to the [EC2 instances page](https://console.aws.amazon.com/ec2/v2/home#Instances) in the console. You should see the EC2 instance you created to install WordPress. Select it and the instance description will show the public IPv4 address.

### Go to your public IPv4 for final Wordpress setup.


You will succeed
Don't steal your homework :)
