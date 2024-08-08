# 03.WordPress App with MySQL Database: Docker Compose YAML file

> Using Docker Composer, to create a docker-compose.yaml file with instructions for creating the MySQL and WordPress containers from the previous task, together in a single network, called my_network

### Docker Compose Commands Explanation
``` bash
# create a netowrk
docker network create my_network
```
[create the docker-compose.yml file](docker-compose.yml)

``` bash
# build and run the multi-container app
docker-compose build

# run the containers
docker-compose up -d
```