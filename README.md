# Home Work 13

# K8S-1

## Dependence:
Download and install Minikube following instructions: [Install Minikube](https://kubernetes.io/ru/docs/tasks/tools/install-minikube/)

### Creating a Project Directory:

```
k8s-webapp-project/
├── app/                           
│   ├── Dockerfile                 
│   ├── requirements.txt           
│   ├── app.py                                
├── manifests/                     
│   ├── namespace.yaml            
│   ├── flask-app-service.yaml    
│   ├── mysql-deployment.yaml  
│   ├── ingress.yaml              
|   ├── mysql-service.yaml
├── README.md                      
```

### Preparing the application:
Flask + PostgreSQL
* Flask will be responsible for the API and simple frontend.
* PostgreSQL for data storage.

### Creating Docker images:

```
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

### For the database, you can use a ready-made image:

```
PostgreSQL: postgres:latest
```

### Build and upload images:

```
docker build -t <your-dockerhub-username>/flask-app .
docker push <your-dockerhub-username>/flask-app
```

### Creating YAML Manifests:

* flask-app-deployment.yaml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
        - name: flask-app
          image: ekh7/flask-app
          ports:
            - containerPort: 5000
```

* mysql-deployment.yaml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
        - name: mysql
          image: mysql:5.7
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: "rootpassword"
          ports:
            - containerPort: 3306
```

* flask-app-service.yaml:

```
apiVersion: v1
kind: Service
metadata:
  name: flask-app
spec:
  selector:
    app: flask-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  type: LoadBalancer
```

* mysql-service.yaml:

```
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  selector:
    app: mysql
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
  type: ClusterIP
```

* ingress.yaml:

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: webapp-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: "192.168.49.2.nip.io"
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: flask-app
            port:
              number: 80
```

### Using manifestos:

```
kubectl apply -f namespace.yaml
kubectl apply -f backend.yaml
kubectl apply -f database.yaml
kubectl apply -f ingress.yaml
```

### Make sure everything is running:

```
kubectl get all -n webapp
```

### Checking work:

* Minikube: Use the minikube tunnel command to access the Ingress.
* Open the application in a browser via the specified domain or IP.
