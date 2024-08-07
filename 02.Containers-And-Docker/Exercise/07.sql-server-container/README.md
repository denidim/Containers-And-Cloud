# 07.SQL Server Container 

> SQL Server Container 

## Docker commands

``` bash
# runn container in detached mode on localhost:1433 create a volume sqldata and map it to the container's directory /var/opt/mssql

docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=yourStrongPassword12! -p 1433:1433 -v sqldata:/var/opt/mssql -d mcr.microsoft.com/mssql/server
```