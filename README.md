# Home Work 5

# Create AMI Image for Application with Packer

## Dependence:
Download and install Packer following HashiCorp's instructions: [Install Packer](https://developer.hashicorp.com/packer/install)

Moving packer files to working directory:
* app.pkr.hcl
* db.pkr.hcl
* plugins.pkr.hcl
* variables.pkrvars.hcl

## To Bild:

```
packer build -var-file=variables.pkrvars.hcl app.pkr.hcl
packer build -var-file=variables.pkrvars.hcl db.pkr.hcl
```

# Tasks with an asterisk:

Move the file: __app.service__ to the directory:
```
/etc/systemd/system/ 
```
Start the service:

```
sudo systemctl daemon-reload
sudo systemctl enable app.service
sudo systemctl start app.service
```
Move the database backup script: __backup_db.sh__ to the required directory: 
```
/usr/local/bin/backup_db.sh
```

Setting up cron to run the script:

```
(crontab -l ; echo "0 1 * * * /usr/local/bin/backup_db.sh") | crontab -
```
