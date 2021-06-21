FROM alpine:3.14

WORKDIR /todoapp
COPY . .
RUN docker-compose build
