# Home Work 8

# Using Ansible Playbooks

## Dependence:
Download and install Packer following HashiCorp's instructions: [Install Packer](https://developer.hashicorp.com/packer/install)

### How does this work:

### Creating a Project Directory:

```
project/
├── packer/
│   ├── app-template.json
│   ├── db-template.json
│   └── variables.json
├── ansible/
│   ├── ansible.cfg
│   ├── app_install.yml
│   ├── db_install.yml
│   └── deploy.yml
└── README.md
```

### Creating playbooks:

* app_install.yml - to install the necessary system packages for the application. This playbook will install Python and the necessary libraries for Flask.
* db_install.yml - for installing MySQL, creating a database and user. This playbook installs MySQL, configures it to listen on all IP addresses, and creates a database and user.
* variables.yaml - specifies parameters for MySQL.
* deploy.yml - for getting application code, installing dependencies, creating a service and launching it.

### Packer templates update:

* We update the Packer template for the application: "app-template.json" to use Ansible as a provisioner.
* We update the Packer template for the database: "db-template.json".

### Using Packer to Create an AMI:
Once you have updated the Packer templates and playbooks, you can create an AMI for the application and database using the command:

```
packer build -var-file=variables.json app-template.json
packer build -var-file=variables.json db-template.json
```

### Application deployment:
Once the AMI images are created, you can deploy EC2 instances from the created images, to deploy the application, use: "deploy.yml":

```
ansible-playbook -i inventory deploy.yml
```

### Security Groups:
Don't forget to configure security groups on [EC2 instances page](https://console.aws.amazon.com/ec2/v2/home#Instances):

* For the application - access to port 8000.
* For the database - access to MySQL from the internal IP address of the application.

### Checking application availability:
Once the application is deployed, check its availability at the URL:

```
http://<app_instance_dns_or_ip>:8000
```

### Troubleshooting:
Error if application is missing: If the application is not configured or running, the error will be:

* 404 Not Found - if routes are not configured for certain paths.
* 502 Bad Gateway - If the correct handler is not configured for port 8000, or if the application is not listening on this port.

You will succeed

Don't steal your homework :)!
