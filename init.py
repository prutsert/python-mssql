import os

mssql={}
for k in ( key for key in os.environ.keys() if key.startswith("MSSQL_")):
    mssql[ k[6:] ] = os.environ.get(k)
    print(f"mssql[\"{k[6:]}\"]={mssql[ k[6:] ]}")

print(str(mssql))

