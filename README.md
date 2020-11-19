# Introduction

Image for testing Microsoft SQL Server / Azure SQL connections


# Usage

Running this image will create an instance of MsSql class, which you can use to run queries against.

Any environment variables you pass along, that start with MSSQL, will be avaiable in Python in the mssql object. The following variables are actually meaningfull:

MSSQL_SERVER
MSSQL_DATABASE
MSSQL_USERNAME
MSSQL_PASSWORD

This isn't functional yet:

kubectl run prutsert -it --rm --restart=Never --image=prutsert/python-mssql --env=MSSQL_SERVER=myserver --env=MSSQL_DATABASE=MyDb  --env=MSSQL_USERNAME=justme

You can also set these variables after starting the container:

mssql.set_password("MyVerySecretPassword")



This is:

kubectl run prutsert -it --rm --restart=Never --image=prutsert/python-mssql --env=MSSQL_SERVER=myserver --env=MSSQL_DATABASE=MyDb  --env=MSSQL_USERNAME=justme -- /bin/bash

And the start: `python -i init.py`


This might work, though beware that the password is actually on the commandline:

kubectl run prutsert -it --rm --restart=Never --image=prutsert/python-mssql --env=MSSQL_SERVER=myserver --env=MSSQL_DATABASE=MyDb  --env=MSSQL_USERNAME=justme -- /opt/mssql-tools/bin/sqlcmd -S ${MSSQL_SERVER} -d ${MSSQL_DATABASE} -U ${MSSQL_USERNAME} -P ${MSSQL_PASSWORD}



