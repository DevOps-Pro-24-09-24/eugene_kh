#!/bin/bash
timestamp=$(date +%F_%T)
backup_file="/tmp/app_db_backup_$timestamp.sql.gz"
s3_bucket=$(aws ssm get-parameter --name "/backup/s3-bucket" --query "Parameter.Value" --output text)
mysqldump -u app_user -p"password" app_db | gzip > $backup_file
aws s3 cp $backup_file s3://$s3_bucket/
find /tmp -name "app_db_backup_*.sql.gz" -mtime +7 -delete
