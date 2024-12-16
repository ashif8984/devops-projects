### Simple Node JS application

This is just a simplet node application to demonstarte the use of
dockerfile to create custom image and deploy containers with it.

---

**Prerequisites**

> - [Node.js](https://nodejs.org/en/download/) installed
> - [Docker](https://www.docker.com/) installed

**Run locally**
```
git clone https://github.com/ashif8984/docker.git
cd node-app
npm init
npm install
node app.js
```
Visit http://localhost:8000 in your browser

**Run using docker container**

```
# Create image
docker build -t ashif8984/nodeapp .

# Run container
docker run --name nodeapp -p 8080:8080 
```

**Using bash script to deploy to docker**

```
chmod +x run.sh
./run.sh
```
