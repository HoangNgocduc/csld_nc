docker run -d --name sql-server -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=p@55w0rd_mssqlserver' -p 1433:1433 microsoft/mssql-server-linux
