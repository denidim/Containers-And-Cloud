# 06.Apache HTTP Server Container 

> Apache HTTP Server Container 

## Docker commands

``` bash
# runn container in detached mode on localhost:8080 with name my-apache-app create a volume – map current PowerShell (or another) directory to the container's directory /usr/local/apache2/htdocs/ 

# When accessed from the browser, it should list the files and folders from your local file system in the PowerShell directory you provided the server with, as well as in child directories

docker run --name my-apache-app -p 8080:80 -d -v C:\Users\fs900\Desktop\SoftUni:/usr/local/apache2/htdocs/ httpd:latest
```