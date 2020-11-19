import pyodbc

class MsSql():
    conf = {}

    def __init__(self):

        import os
        for k in ( key for key in os.environ.keys() if key.startswith("MSSQL_")):
            self.conf[ k[6:] ] = os.environ.get(k)

    def set_server(self, server):
        self.conf["server"] = server

    def set_database(self, database):
        self.conf["password"] = database

    def set_username(self, username):
        self.conf["password"] = username

    def set_password(self, pw):
        self.conf["password"] = pw

    def connect(self):
        connectstring = ( "DRIVER=ODBC Driver 17 for SQL Server;"
            "SERVER={0};DATABASE={1};UID={2};PWD={3};"
            .format(
                self.conf["server"], self.conf["database"], self.conf["username"], self.conf["password"]
            )
        )
        connection = pyodbc.connect(connectstring)
        return connection

mssql = MsSql()

