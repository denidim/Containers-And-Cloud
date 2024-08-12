# 04.MariaDB Client and Server in a Network

> MariaDB Server (a variant of MySQL) is one of the most popular open-source relational databases. You should use it documentation on Docker Hub to create two containers, which will work together:

> MariaDB database server container, initialized with database user and password.

> Another container, which will run the MariaDB command line client against the MariaDB server container, allowing you to execute SQL statements against your database instance. Both containers will use the same Docker image. The image is available here: https://hub.docker.com/_/mariadb.

### Docker Commands Explanation
``` bash
# create a netowrk
docker network create mariadb_network

# run mariadb_server container in a network
docker run -d --network mariadb_netowrk --name mariadb_server -e MARIADB_USER=example-user -e MARIADB_PASSWORD=my_cool_secret -e MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:latest

# run mariadb_client container in a network
docker run -it --network mariadb_network --name mariadb_client mariadb mariadb -hmariadb_server -uexample-user -p
```