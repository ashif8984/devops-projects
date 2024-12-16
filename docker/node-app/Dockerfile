# base node image
FROM node:11.8

# set the workdir inside the docker filesystem
WORKDIR /usr/src/app

# copy all the files in current directory to workdir in docker
COPY . .

# install the packages
RUN npm install

# port exposed
EXPOSE 3000

# run the cmd when starting the container
CMD node app.js