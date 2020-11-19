# Introduction

Image for testing Microsoft SQL Server / Azure SQL connections


# Usage

Running this image will give you a Python (3.8) prompt, with an object `mssql` that you can use to test connections and queries.

Any environment variables you pass along, that start with MSSQL, will be avaiable in Python in the `mssql.conf` dict. Only the following variables are actually meaningfull:

MSSQL_SERVER
MSSQL_DATABASE
MSSQL_USERNAME
MSSQL_PASSWORD

This should give you a Python prompt, with every but the password already in place:
`kubectl run prutsert -it --rm --restart=Never --image=prutsert/python-mssql --env=MSSQL_SERVER=myserver --env=MSSQL_DATABASE=MyDb  --env=MSSQL_USERNAME=justme`

Feed the password to mssql (note that the password will be a readable string in `mssql.conf`):
`mssql.set_password("MyVerySecretPassword")`

And connect to the database to do stuff:
```python
conn = mssql.connect()
testcursor = conn.execute('select 1')
testcursor.fetchall()
```

For more flexible usage, just run the container with a bash prompt:
`kubectl run prutsert -it --rm --restart=Never --image=prutsert/python-mssql --env=MSSQL_SERVER=myserver --env=MSSQL_DATABASE=MyDb  --env=MSSQL_USERNAME=justme -- /bin/bash`

This will give you the option to start Python prompt with the `mssql` object, as mentioned above:
`python -i init.py`

But it will also allow you to run sqlcmd:
/opt/mssql-tools/bin/sqlcmd -S ${MSSQL_SERVER} -d ${MSSQL_DATABASE} -U ${MSSQL_USERNAME}

Or install mssql-cli:
apt-get update && apt-get install libicu63
```bash
pip install mssql-cli

mssql-cli -S ${MSSQL_SERVER} -d ${MSSQL_DATABASE} -U ${MSSQL_USERNAME}
```

# LICENSE

I don't care. But by using this image, you agree to Microsofts license agreement as described in MICROSOFT_SOFTWARE_LICENSE_TERMS.txt


# TODO

- Characters `[]{}(),;?*=!@` in passwords aren't escaped in the ODBC connectstring, so trying to connect with one of these will fail.

