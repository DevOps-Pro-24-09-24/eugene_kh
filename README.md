# Home Work 9

# Ansible roles

## Infrastructure preparation:

## Two servers:

* One for the web application.
* The second one is for the database.
* Ansible control node: Install Ansible on the control machine.
* Connecting via SSH: Make sure Ansible has access to the servers.

### Creating a Project Directory:

```
project/
├── ansible.cfg
├── inventory/
│   ├── hosts
├── playbook.yml
├── roles/
│   ├── app/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── templates/
│   │   └── vars/
│   │       └── main.yml
│   ├── db/
│       ├── tasks/
│       │   └── main.yml
│       ├── templates/
│       └── vars/
│           └── main.yml
```

### Creating Inventory
Create an "inventory/hosts" file to describe your servers

### Setting up "ansible.cfg"
Add basic configuration

### Creating Roles
Role for web application (roles/app) tasks/main.yml: Describe installing the necessary packages and deploying the application.
+ vars/main.yml: Set variables for RHEL and Debian.

### Database role (roles/db)
tasks/main.yml: Install and configure the database.
+ vars/main.yml: Specify differences between RHEL and Debian.

### Creating a Playbook
Create a playbook.yml file

### Playbook launch
Check the connection:

```
ansible all -m ping
```

### Run the playbook:

```
ansible-playbook playbook.yml
```

## Testing
* Check that the web application is accessible over the web server IP.
* Make sure the database is configured and the connection to the web application is established.
