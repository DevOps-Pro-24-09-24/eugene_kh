# Creating an AMI image for a database instance:

## Script for user-data that can be used to automatically install MariaDB:

```
#!/bin/bash
yum update -y
yum install -y mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation <<EOF
```

## Creating an AMI:

### After MariaDB is installed, you can create an AMI from that instance through the AWS Management Console

## Configuring the web application:

### Script for automatic installation of a web server:

```
#!/bin/bash
yum update -y
yum install -y httpd php php-mysql
systemctl start httpd
systemctl enable httpd
```

# Setting up Security Groups is done through the AWS Management Console:

# Checking the accessibility of the web application:

```
curl -I http://192.168.0.173

HTTP/1.1 200 OK
Date: Fr, 18 Oct 2024 18:34:56 GMT
Server: Apache/2.4.41 (Ubuntu)
Last-Modified: Fr, 18 Oct 2024 18:32:17 GMT
Content-Type: text/html; charset=UTF-8
Content-Length: 1234
Connection: keep-alive
```
# SSH automation:

```
#!/bin/bash

# Copy new SSH keys
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, KeyName]' --output text | while read instance key_name; do
# Add your code to update SSH configurations
echo "Updating SSH configuration for instance $instance with key $key_name"
done
```


