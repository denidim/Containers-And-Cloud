# 02.WordPress App with MySQL Database: Connecting Containers in a Network

> Set up and run a WordPress container in Docker with a MySQL database by connecting them in a network


## Add MySQL Container to Network
``` bash
docker run -dit --name wordpress_db -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=wordpressdb -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --expose 3306 --expose 33060 --network my_network -v %cd%/data:/var/lib/mysql mysql
```
## Add WordPress Container to Network
``` bash
docker run -dit --name wordpress-website -e WORDPRESS_DB_HOST=wordpress_db -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpressdb -v %cd%/wp-data:/var/www/html -p 80:80 --network my_network wordpress
```


### MySQL Commands Explanation
``` bash
# create a netowrk
docker network create my_network

# runs the image detached and in interactive mode
docker run -dit

# names the container wordpress_db
--name wordpress_db

# sets the password for the root MySQL user;
-e MYSQL_ROOT_PASSWORD=pass

# sets the name of the MySQL database that we'll use for the WordPress installation
-e MYSQL_DATABASE=wordpressdb

# sets the MySQL user that we'll use for the WordPress installation
-e MYSQL_USER=wordpress

# sets the password for that user
-e MYSQL_PASSWORD=wordpress

# sets the port of the container
--expose 3306

# sets the SSL port of the container
--expose 33060

# sets the network that we want to attach our container to
--network my_network 

# maps the directory on our local machine to the directory of the container, so that we can store data outside of it (PowerShell)
-v ${PWD}/data:/var/lib/mysql

# the name of the image
mysql 
```

### WordPress Command Explanation
```bash
# sets the WordPress database host, which matches the name of our MySQL container that we set up in Step 2
-e WORDPRESS_DB_HOST=wordpress_db 

# sets the WordPress user that we previously set up
-e WORDPRESS_DB_USER=wordpress 

# sets the password for the user
-e WORDPRESS_DB_PASSWORD=wordpress 

# sets the name of the WordPress database, that we created
-e WORDPRESS_DB_NAME=wordpressdb 
```