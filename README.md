# Home Work 6

# Basic project on Terraform, AWS VPC with Terraform

## Dependence:

Download and install Terraform following HashiCorp's instructions: [Install Packer](https://developer.hashicorp.com/terraform/install)

### Creating a file structure in the terraform working directory:

```
* provider.tf: AWS provider settings.
* backend.tf: Settings for remote backend.
* main.tf: Description of VPCs, subnets and EC2 instances.
* sg.tf: Description of Security Groups.
* variables.tf: Definition of input variables.
* outputs.tf: Description of output variables.
```


## Before starting, make sure the S3 bucket and DynamoDB table already exist or create them using AWS Management Console or Terraform !!!

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

## After deployment:

### Check the output: After successfully running terraform apply, you will see the output variables you configured in outputs.tf, including the IP addresses and DNS names of your resources.

### Monitor resources: Go to the AWS Management Console to ensure that all resources are created correctly.

