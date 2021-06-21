# todo-docker-demo

# Single Step to deploy this app on any VM having Docker pre-installed
  make deploy

# Single Step to stop this app on any VM having Docker pre-installed
  make down

#This app is using sqlite DB, Django 3 and Vue 3 coupled together. 

#Makefile is responsible for all deployment related commands settings.

#Please add new .env file by this command
  cp .env.sample .env

# After this set credentials in the .env file created by above command
