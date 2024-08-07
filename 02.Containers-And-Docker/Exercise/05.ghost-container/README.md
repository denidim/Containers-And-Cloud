# 05.Ghost Container

> Ghost Container

## Docker commands

``` bash
# runn container in detached mode on localhost:3001 with environment variable development and name ghost-container
docker run --name ghost-container -p 3001:2368 -e NODE_ENV=development -d ghost:latest
```