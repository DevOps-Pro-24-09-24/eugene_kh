# Creating VPCs and Subnets:

## Create VPC:

```
aws ec2 create-vpc --cidr-block 192.168.0.0/24
```

## Create public and private subnets:

```
aws ec2 create-subnet --vpc-id vpc-******* --cidr-block 192.168.0.0/25
aws ec2 create-subnet --vpc-id vpc-******* --cidr-block 192.168.0.128/25
```

# Adding security groups:

## Создать security group sg-FRONT:

```
aws ec2 create-security-group --group-name s_g-FRONT --description "Allow SSH" --vpc-id vpc-*******
```

## Configure rules for sg-FRONT:

```
aws ec2 authorize-security-group-ingress --group-id sg-******* --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-egress --group-id sg-******* --protocol all --cidr 0.0.0.0/0
```

## Create security group sg-BACK:

```
aws ec2 create-security-group --group-name s_g-BACK --description "Backend access" --vpc-id vpc-*******
```

## Create rules for sg-BACK:

```
aws ec2 authorize-security-group-ingress --group-id sg-******* --protocol all --source-group sg-*******
aws ec2 authorize-security-group-egress --group-id sg-******* --protocol all --cidr 0.0.0.0/0
```

# Creating EC2 instances:

## Launch a WEB instance in a public subnet:

```
aws ec2 run-instances --image-id ami-0084a47cc718c111a --count 1 --instance-type t2.micro --key-name Main --security-group-ids sg-03201cfe2c1e0f663 --subnet-id subnet-04754d3ba3fb71bcb
```

## Launch a DB instance in a private subnet:

```
aws ec2 run-instances --image-id ami-0084a47cc718c111a --count 1 --instance-type t2.micro --key-name Main --security-group-ids sg-0d163b55076ee2cd9 --subnet-id subnet-0f54aee01199465eb
```

# Setting up SSH via jump host:

## Setting up SSH via web server to access the database:

To do this, to allow access to your database server via SSH from a regular bastion host, you need to make changes to your ~/.ssh/config configuration file:

```
Host bastion
    HostName 192.168.0.125
    User ubuntu
    IdentityFile ~/.ssh/private_key.pem

Host db-server
    HostName 192.168.0.168
    User ubuntu
    IdentityFile ~/.ssh/private_key.pem
    ProxyJump bastion
```
## The command for connecting to db-server via bastion will look like this:

```
ssh db-server
```
