FROM python:3.7

WORKDIR /todoapp
COPY . .
RUN docker-compose build
