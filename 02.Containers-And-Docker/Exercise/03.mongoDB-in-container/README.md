# 03.MongoDB in Container

> A MongoDB in Container

## Docker commands

``` bash
# runn container from any folder and attach a folder with absolute path as a volume
docker run -p 27017:27017 -v C:\Users\fs900\Desktop\Containers-And-Cloud\02.Containers-And-Docker\Exercise\03.mongoDB-in-container\data:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=mongoadminpass -d mongo
```
``` bash
# runn container from the current folder and attach it as a volume [Command Propmt]
docker run -p 27017:27017 -v %cd%:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=mongoadminpass -d mongo
```
``` bash
# create volume and use it to percist db-data
docker volume create mongodata
docker run -p 27017:27017 -v mongodata:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=mongoadminpass -d mongo
```
1. `docker run`: This command runs a new container based on an image.
2. `-p 27017:27017`: The `-p` flag maps the container's port to the host machine's port. In this case, both ports
are set to `27017`, allowing communication between the host and the container.
3. `-v %cd%\data:/data/db`: The `-v` flag creates a volume, which is a shared storage space accessible by multiple
containers. `%cd%` represents the current working directory on your host machine, while `/data/DB` refers to the
location within the container.
4. `-e MONGO_INITDB_ROOT_USERNAME=mongoadmin`: This `-e` flag sets an environment variable for the
`MONGO_INITDB_ROOT_USERNAME` with a value of `mongoadmin`. This is used to configure MongoDB's initial database
user.
5. `-e MONGO_INITDB_ROOT_PASSWORD=mongoadminpass`: Another `-e` flag that sets the `MONGO_INITDB_ROOT_PASSWORD`
environment variable, this time with a value of `mongoadminpass`.
6. `-d mongo`: The `-d` flag detaches the container from the terminal, meaning it will run in the background. The
last term, `mongo`, is the name of the image being used to create the new container.

In summary, this Docker command runs a MongoDB container with the specified environment variables for initial
database user and password, along with port mapping and volume sharing.