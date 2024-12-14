# Home Work 11

# Docker-2

## Dependence:
Download and install Docker following instructions: [Install Docker](https://docs.docker.com/engine/install/) + [Install Docker Compose](https://docs.docker.com/compose/install/linux/)

### Creating a Project Directory:

```
project/
├── app/
│   ├── app.py
│   ├── requirements.txt
├── Dockerfile
├── compose.yaml
├── .env
├── nginx.conf
├── certs/
│   ├── server.key
│   ├── server.crt
```

### Preparing and uploading a Docker image to Docker Hub:

### Login to Docker Hub:

* Make sure you have a Docker Hub account. If not, [register] (https://app.docker.com/signup).
* Login to Docker via terminal:
```
docker login
```
* Tagging the Docker image:
```
docker tag web-app ekh7/hw-11
```
* Uploading the image to Docker Hub:
```
docker push ekh7/hw-11
```
### Using an image from Docker Hub:
In compose.yaml we will change the app section to use the image from Docker Hub:
```
version: "3.9"
services:
  app:
    image: ekh7/hw-11
    ports:
      - "5000:5000"
    environment:
      - DB_HOST=db
      - DB_USER=root
      - DB_PASSWORD=password
      - DB_NAME=testdb
    depends_on:
      - db
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: testdb
    volumes:
      - db_data:/var/lib/mysql
volumes:
  db_data:
```
Run docker-compose:
```
docker-compose up
```
### Setting up HTTPS via NGINX reverse proxy:
Add NGINX as a reverse proxy to work with HTTPS in compose.yaml:
```
version: "3.9"
services:
  app:
    image: ekh7/hw-11
    expose:
      - "5000"
    environment:
      - DB_HOST=db
      - DB_USER=root
      - DB_PASSWORD=password
      - DB_NAME=testdb
    depends_on:
      - db
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: testdb
    volumes:
      - db_data:/var/lib/mysql
  nginx:
    image: nginx:latest
    ports:
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - ./certs:/etc/nginx/certs:ro
volumes:
  db_data:
```
### Create the nginx.conf file:
```
server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/certs/server.crt;
    ssl_certificate_key /etc/nginx/certs/server.key;

    location / {
        proxy_pass http://app:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
### Create a self-signed certificate for testing:
```
mkdir certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout certs/server.key -out certs/server.crt \
    -subj "/CN=localhost"
```
Run docker-compose:
```
docker-compose up --build
```
### Configuring macvlan or ipvlan for an IP address in the host subnet:

Creating a macvlan network:
```
docker network create -d macvlan \
  --subnet=192.168.67.0/24 \
  --gateway=192.168.67.1 \
  -o parent=eth0 macvlan_net
```
### Update compose.yaml - Add a macvlan network to the application:
```
version: "3.9"
services:
  app:
    image: ekh7/hw-11
    networks:
      macvlan_net:
        ipv4_address: 192.168.67.101
  db:
    image: mysql:8.0
    networks:
      - macvlan_net
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: testdb
networks:
  macvlan_net:
    external: true
```
### Testing:

Start all containers:
```
docker-compose up
```
Check:

* The application is available via HTTPS at https://192.168.67.101.
* The database uses a macvlan network.
