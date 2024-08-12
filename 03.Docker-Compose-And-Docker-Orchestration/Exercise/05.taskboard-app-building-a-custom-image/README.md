# 05.TaskBoard App: Build Custom Image

> In this task and in the other two tasks connected to the TaskBoard app, we will work on the following ASP.NET 6 MVC app with a SQL Server database, provided in the resources:
Our task is to create a custom image for this app. Later, we will also publish this image in Docker Hub.

> Step 1: Create a Dockerfile in Visual Studio
>>right-click on the "TaskBoard.WebApp" project and select [Add] - [Docker Support…]:
Then, you should choose a target OS for the Dockerfile – choose [Linux]

> Step 2: Build and Publish the Image to Docker Hub

### Docker Commands Explanation
``` bash
# build image
docker build -t taskboard -f TaskBoard.WebApp\Dockerfile .
# change tag
docker tag taskboard your-docker-hub-name/taskboard
# push to docker hub
docker push your-docker-hub-name/taskboard
``` 