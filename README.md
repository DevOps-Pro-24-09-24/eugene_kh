# Home Work 12

# Jenkins

## Dependence:
Download and installing Jenkins following instructions: [Installing Jenkins](https://www.jenkins.io/doc/book/installing/)

### Accessing the Jenkins interface:
* Go to the browser at: http://<IP_address_of_the_server>:8080.
* The file /var/lib/jenkins/secrets/initialAdminPassword will display the temporary password.
* Enter it in the interface.

## Basic setup:

* Set up preferred connectors.
* Create the first administrator (login/password).
* Check and configure the system:
* Go to "Manage Jenkins" -> "Configure System".
* Specify the Jenkins URL (e.g. http://<your_IP>:8080).

## Attach slave node to master node:
Preparing the server for the slave node:

* Install Java on the slave:
```
sudo apt update
sudo apt install openjdk-17-jdk -y
```

* Create a user for Jenkins, for example:
```
sudo adduser jenkins
```

## Setting up a Master-Slave connection:
On the master node in the Jenkins interface:
* Go to Manage Jenkins -> Manage Nodes and Clouds.
* Click New Node and create a new node.
* Specify the node name, type (Permanent Agent), working directory and number of executors.

## Connecting a slave node:
* After creating the node, copy the command to start the agent.
* On the slave server, run the command from the master.
```
java -jar agent.jar -jnlpUrl <URL> -secret <secret_key> -workDir "/var/jenkins_agent"
```
* Make sure the node appears in the "Connected" status.

## Launching the pipeline:
Creating a Pipeline:

* On the master node, create a new item (New Item).
* Select Pipeline.
* In the Pipeline section, select one of the examples or write your own:
```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
```

## Launch Pipeline:
* Click Build Now.
* Verify that execution is successful.
* Look at the logs for analysis.

## Result:
* Running Jenkins Master with access via the web interface.
* Connected slave agent, displayed in Manage Nodes.
* A working pipeline with successful execution stages.
