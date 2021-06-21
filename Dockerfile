FROM python:3.7

WORKDIR /todoapp
COPY . .
RUN apt-get install vim
RUN docker-compose build
