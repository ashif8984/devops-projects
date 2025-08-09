# Getting Started with Kubernetes

1. Overview/Context
2. Create a simple application
3. Containerize the application
4. Push to Container registry
5. Create cluster
6. Create K8s resources definations
7. Apply the K8s resources
8. Deploy the app in the K8s cluster

### Deploy app locally

1. Create a virtual environment for python

    ```
    python3 -m venv ./venv
    source ./venv/bin/activate
    ```

2. Install the below packages

    ```
     pip install fastapi
     pip install "fastapi[standard]"
     pip install uvicorn
     pip freeze
     code requirements.txt
     pip install -r requirements.txt

    ```
3. Create an app - [Fast-API](https://fastapi.tiangolo.com/#create-it)
 
    ```
     mkdir app
     cd app
     touch __init.py__
     code main.py
    ```

    ```
    from fastapi import FastAPI
    import os

    app = FastAPI()

    @app.get("/")
    async def root():
        return {"message": "Hello:" f"From: {os.environ.get('HOSTNAME', 'DEFAULT_ENV')}"}
    ```
4. Run the app locally
 
    ```
    fastapi dev main.py
    ```

### Containerize the App inside docker container

1. Create a Dockerfile [FastApi Container](https://fastapi.tiangolo.com/deployment/docker/?h=container#create-the-fastapi-code)

    ```
    FROM python:3.9
    WORKDIR /code
    COPY ./requirements.txt /code/requirements.txt
    RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
    COPY ./app /code/app
    CMD ["fastapi", "run", "app/main.py", "--port", "80"]
    ```
2. Build the Docker image

    ```
    docker build -t k8s-fast-api .
    ```

3. Run the container locally to validate

    ```
    docker run --name k8s-fast-api -p 8000:80 k8s-fast-api
    ```

4. Access the application on port 8000 on localhost

    ```
    curl localhost:8000
    {"message":"Hello:From: DEFAULT_ENV"}%
    ```

5. Push the image to DockerHub registry
   
   - We will create a repository in docker hub first
   - Then we will copy the name of image format generated
   - Update or create a fresh image
   - Push to repository in the registry
    ```
    docker login
    docker build -t ashif8984/k8s-getting-started:0.0.1 .
    docker push ashif8984/k8s-getting-started:0.0.1
    ```

### Create Kubernetes Cluster on Cloud

There are plenty of offerings from different cloud provider to create a cluster for kubernetes. We can use any of them as per preference. 
Example:
- Google Kubernetes Engine (GKE)
- Azure Kubernetes Service (AKS)
- Amazon Elastic Kubernetes Service (EKS)

1. Create cluster with x number of nodes
2. Install Kubectl cmd line tool
3. Generate credentials so that kubectl can connect to cluster
4. Validate using - kubectl get nodes


### Create deployment objects

  ```
    mkdir kubernetes
    touch kubernetes/deployment.yaml
    touch kubernetes/service.yaml
    kubectl apply -f
    kubectl get deployments
    kubectl get pods
    kubectl get service
  ```

### Validate application running from the ExternalIP

  ```
    kubectl get services
    curl http://<EXTERNAL_IP>:8000
  ```
