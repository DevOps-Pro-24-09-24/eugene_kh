# Home Work 10

# Docker-1

## Dependence:
Download and install Docker following instructions: [Install Docker](https://docs.docker.com/engine/install/)

### Creating a Project Directory:

```
project/
├── app/
│   ├── app.py
│   ├── requirements.txt
├── Dockerfile
├── compose.yaml
└── .env         
```

### How does this work:

* Writing a web application - In this HW we will create a Flask application. It will connect to the database and output data: "app/app.py".
* We create a list of dependencies: "app/requirements.txt".
* Creating a Dockerfile - The Dockerfile describes how the Docker image for our application will be built.
* Create compose.yaml - The Compose file manages several containers: an application and a database.
* Create a .env file - File for storing environment variables.

### Let's launch the project:

* We build Docker images and launch containers:
```
docker-compose up --build
```

* Check if the application is running:

```
http://localhost:5000
```


