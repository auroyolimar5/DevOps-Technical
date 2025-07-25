FROM python:3.11

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        git \
        nginx

# Instalar requirementos
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

WORKDIR /DevOps-Technical