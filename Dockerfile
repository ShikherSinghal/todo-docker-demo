FROM python:3.7

WORKDIR /todoapp
COPY . .
RUN pip install docker-compose
RUN docker-compose build
