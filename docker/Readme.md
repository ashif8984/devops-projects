

### Docker Commands

---
<details>

  <summary> Docker Container </summary>

  Run a container
  ```
  docker run -it ubuntu
  docker run -it ubuntu -p 8080:8080 image #hostport:containerport
  docker run -d ubuntu # background

  docker run -name test -itd -p 8000:8000 ashifnode #default port
  docker run -name test -itd -e PORT=8090 -p 8090:8090 ashifnode #customport
  ```

  List container
  ```
  docker container ls
  docker container ls -a
  docker ps
  docker ps -a
  ```
  Start/Stop Container
  ```
  docker start <container>
  docker stop <container>
  docker kill $ID
  ```

  Execute a command inside a container
  ```
  docker exec cf013588acbb ls -lrt
  docker exec -it cf013588acbb ls -lrt #attached mode
  ```


  
</details>

<details>
  <summary>Docker Images</summary>

  List Images
  ```
  docker images
  ```

  Other image commands
  ```
  docker history image  #Image history 
  docker inspect image  #show low-leve info
  docker tag image tag_name  #tagging image
  docker commit container image  #create image from container
  ```

  Delete Images
  ```
  docker rmi image
  ```
 
  Build image from dockerfile
  ```
  docker build -t ashif-nodejs .
  ```

  Sample Dockerfile
  ```
    # Base Image
    FROM node:11.8

    # set a workdir inside docker
    WORKDIR /usr/src/app

    # copy . (all in the current directory) to . (WORKDIR)
    COPY . .

    # run a command - this will run when building the image
    # RUN npm install

    # the port we wish to expose
    EXPOSE 8000

    # run a command when running the container
    CMD node server.js

  ```

</details>

<details>
  <summary>Docker compose</summary>

  Docker compose commands
  ```
    docker compose -d up
    docker compose -d down
  ```

  [Awesome Docker compose ](https://github.com/docker/awesome-compose/tree/master/minecraft)


</details>


<details>
  <summary>Docker Networking</summary>

  Default - Bridge Network

  List networks
  ```
    docker network ls
  ```

  Inpsect network
  ```
    docker network inspect bridge
  ```
  Custom Network

  ```
  1. Create a network : 
  docker run -it --name ironman --network=mynet busybox
  2. Create a 1st Container with above network : 
  docker run -it --name ironman --network=mynet busybox
  3. Create a 2nd Container with above network : 
  docker run -it --name thanos --network=mynet busybox
  4. Ping container1 from Container2 vice-versa

  ```
  

</details>

<details>
  <summary>Docker Volumes</summary>
  

  Mount host volume path inside container
  ```
  docker run -it --name mycont -v /Users/ashif/Desktop/testfolder:/home/testfolder ubuntu
  ```


</details>

---

###  Useful Images

<details>
  <summary>Jenkins</summary>

  ```
  docker pull jenkins/jenkins
  docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins/jenkins

  http://localhost:8080
  ```
  [Jenkins on Docker](https://medium.com/@eloufirhatim/install-jenkins-using-docker-e76f41f79682)

</details>


<details>
  <summary>ubuntu-ssh-enabled</summary>

  ```
  docker pull mmumshad/ubuntu-ssh-enabled
  docker run -d mmumshad/ubuntu-ssh-enabled
  docker inspect <container-id-name>
  ssh <container-ip>

  http://localhost:8080
  ```
  [Ubuntu on Docker](https://hub.docker.com/r/mmumshad/ubuntu-ssh-enabled)

</details>



---


###  My Docker Hub

* [Docker Registry](https://hub.docker.com/repositories/ashif8984)


### Useful references:

* [Docker Playground](https://labs.play-with-docker.com/)

* [Docker Tutorial for Beginners](https://hashnode.com/post/docker-tutorial-for-beginners-cjrj2hg5001s2ufs1nker9he2)

* [Docker in Development](https://serversforhackers.com/s/docker-in-development)

* [Docker curricullum](https://docker-curriculum.com/)

* [Play with Docker Classroom](https://training.play-with-docker.com/)

* [ubuntu-ssh-enabled image](https://hub.docker.com/r/mmumshad/ubuntu-ssh-enabled)
* [Awesome Docker compose ](https://github.com/docker/awesome-compose/tree/master/minecraft)

----