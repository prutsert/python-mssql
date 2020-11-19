FROM python:3.8-slim

COPY requirements.txt .
COPY *.py .

RUN apt-get update \
 && apt-get install -y curl apt-transport-https gnupg2 unixodbc-dev build-essential \
 && rm -rf /var/lib/apt/lists/* \
 && curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl -s https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
 && apt-get update \
 && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install --no-cache-dir -r ./requirements.txt \
 && useradd -u 1000 -ms /bin/bash worker

CMD python -i ./init.py

