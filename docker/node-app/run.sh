#!/bin/bash

# This script does-

# 1. Creates docker image from Dockerfile
# 2. Runs a container using the image
# 3. Test the server status
# 4. Cleans up the Docker resources (conditional)

echo "=============================================="
echo -e " Deploying nodejs app to Docker Container"
echo "=============================================="

PORT=8000
HOSTNAME=localhost

run(){
    # name of docker images
    read -p "Enter docker image name <DOCKER_HUB_ID/IMAGE_NAME> : " image

    # name of docker container
    read -p "Enter docker container/app name : " container

    echo -e "\n"
    echo "### Building image from Dockerfile...."
    docker build -t $image . > /dev/null 2>&1

    docker_image=`docker images | awk '{print $1}' | grep -o $image`
    echo "Docker image created : $docker_image"
    
    echo -e "\n"
    echo "### Building container - $container from image...."
    docker run --name $container -p $PORT:$PORT -d $docker_image > /dev/null 2>&1

    docker_cont=`docker ps -aqf "name=$container"`
    echo "Docker container created : $docker_cont"
    echo -e "\n"

    
    # App running at http://<localhost>:<port>
    echo "App is running on : http://$HOSTNAME:$PORT"
}

connect(){

    status_code=$(curl -I http://$HOSTNAME:$PORT 2>/dev/null | head -n 1 | cut -d$' ' -f2)

    if [[ "$status_code" -eq 200 ]] ; then
      echo "The website is up & running , status code: $status_code" 
    else

      echo "The website is down. Response code: $response"
      exit 0
    fi
    
}

cleanup(){

    echo -e "\n"
    echo “### Cleaning Started....”
    # Stop the container
    echo "Stopping the container - $docker_cont"
    docker stop $docker_cont 2>/dev/null
    sleep 10
    # Delete the container
    echo "Deleting the container - $docker_cont"
    docker rm $docker_cont 2>/dev/null
    # Delete the image
    echo "Deleting the image - $docker_image"
    docker rmi $docker_image 2>/dev/null
    
}


# Run the app
run

# Test the app:
connect

# Cleanup resources
read -p "Do you want to clean the resources [y/n] :" user_input

if [[  $user_input = "y" ]]; 
then
  cleanup
fi

