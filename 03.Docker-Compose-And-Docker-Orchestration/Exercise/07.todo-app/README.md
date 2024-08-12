# 07.TODO App

> TODO app (provided in the resources) is a simple app for adding tasks, which you should Dockerize

>It is a React application with a NodeJS backend and a MongoDB database. You should create the separate Docker containers and connect them in two networks as shown below to make the three containers work together

![alt text](<Screenshot 2024-08-12 192302.png>)

### Requirements 

01. Name the three containers "frontend", "backend" and "mongo" 

02. Build images from the provided Dockerfiles for the frontend and backend services 

03. Use the latest image for MongoDB from Docker Hub  

04. Expose the frontend service on port 3000 (see on which port the app works by yourself) 

05. Mount the following host directories as volumes: 

    5.1 For mongo service: ./data:/data/db

06.  Connect the frontend and backend services to the react-express network and the backend and mongo services to the express-mongo network 


>When ready, you should be able to add tasks to the TODO list in the app


### Docker Commands
``` bash
docker pull mongo:latest
docker network create react-express
docker network create express-mongo
docker build -t backend .
docker build -t frontend .
docker run --name frontend -p 3000:3000 -d --network react-express frontend
docker run --name mongo -d  --network express-mongo -v ./data:/data/db mongo
docker run --name backend -d --network react-express backend
docker network connect express-mongo backend
``` 