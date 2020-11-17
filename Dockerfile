FROM python:3.8

COPY requirements.txt .
COPY *.py .

RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl -s https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
 && apt-get update \
 && apt-get install -y curl apt-transport-https gnupg2 unixodbc-dev \
 && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
 && pip3 install --no-cache-dir -r ./requirements.txt \
 && useradd -u 1000 -ms /bin/bash worker

CMD python -i ./init.py

