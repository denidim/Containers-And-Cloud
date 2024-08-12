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

# 07.TaskBoard App: Connect Containers in a Network

>In this task, we will connect the TaskBoard ASP.NET 6 MVC app to its SQL Server database. They will both be in separate Docker containers, which will be connected to a common network and this will allow them to communicate with each other. 

>After we have an image for the TaskBoard app and know how to run a SQL Server container, let's learn how to create and connect them to a network

>Step 1: Create a Network

### Docker Commands Explanation
``` bash
# create network
docker network create taskboard_network
# see all networks
docker network ls
# change tag
docker tag taskboard your-docker-hub-name/taskboard
# push to docker hub
docker push your-docker-hub-name/taskboard
``` 

>Step 2: Create and Connect a SQL Server Container 


### Docker Commands Explanation
``` bash
# run a SQL Server container inside our taskboard_network 
docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=yourStrongPassword12# -p 1433:1433 -v sqldata:/var/opt/mssql --rm --network taskboard_network --name sqlserver -d mcr.microsoft.com/mssql/server
``` 

>Step 3: Create and Connect a TaskBoard App Container

>>change the database connection string of the app, so that it can connect to the SQL Server database

``` bash
"Server=sqlserver;Database=MyDB;User Id=sa;Password=yourStrongPassword12#;MultipleActiveResultSets=true"
```
>> build the app image again, so that changes are reflected

``` bash
docker build . -f ./TaskBoard.WebApp/Dockerfile -t your-docker-hub-name/taskboard
```

>>  run the app

``` bash
docker run -d -p 5000:80 --rm --name web_app --network taskboard_network denidim/taskboard
```

>> check logs

``` bash
docker logs web_app -f
```


