<<<<<<< HEAD
# Eugene Kh
## Homeworks:

### HW-1. [Git pre-commit job](https://github.com/DevOps-Pro-24-09-24/eugene_kholodniak/tree/hw-1)
### HW-3. [AWS VPC](https://github.com/DevOps-Pro-24-09-24/eugene_kholodniak/tree/hw-3)
### HW-5. [Create AMI Image for Application with Packer](https://github.com/DevOps-Pro-24-09-24/eugene_kholodniak/tree/hw-5)
### HW-6. [Basic project on Terraform, AWS VPC with Terraform](https://github.com/DevOps-Pro-24-09-24/eugene_kholodniak/tree/hw-6)
=======
# Home Work 5

# Create AMI Image for Application with Packer

## Dependence:
### Download and install Packer following HashiCorp's instructions: (https://developer.hashicorp.com/packer/install)
### Moving packer files to working directory

## To Bild:

```
packer build -var-file=variables.pkrvars.hcl app.pkr.hcl
packer build -var-file=variables.pkrvars.hcl db.pkr.hcl
```


## Tasks with an asterisk

### Move the file: "app.service" to the directory: /etc/systemd/system/ 
## Start the service:

```
sudo systemctl daemon-reload
sudo systemctl enable app.service
sudo systemctl start app.service
```
## Move the database backup script to the required directory: /usr/local/bin/backup_db.sh

## Setting up cron to run the script

```
(crontab -l ; echo "0 1 * * * /usr/local/bin/backup_db.sh") | crontab -
```
>>>>>>> 38230a3 (AMI Image for Application with Packer)
