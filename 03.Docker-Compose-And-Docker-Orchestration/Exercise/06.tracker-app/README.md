# 06.Tracker App

> Your task now is to run a simple JavaScript front-end app based on Vue.js for keeping track of daily duties in a Docker container. It does not need anything but an image to run. It does not use a database or any other types of storage. 
You're provided with its files it in the resources, together with a Dockerfile which runs the app on NGINX server: 

>First, build a custom image {username}/tracker_app from the given Dockerfile:

>Push the image to Docker Hub:

>Then, use it to run the Vue app in a container (think about the internal port on which the app works):

>Finally, access the app from the browser – it should be working:

### Docker Commands Explanation
``` bash
# build image
docker build -t your-docker-hub-name/tracker:1.0
# push to docker hub
docker push your-docker-hub-name/tracker:1.0
# run the app in container
docker run -d -p 80:80 --name tracker_app your-docker-hub-name/tracker:1.0
``` 