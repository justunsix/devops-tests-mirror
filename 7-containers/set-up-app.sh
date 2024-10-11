#!/bin/bash

# Set up application and run its Docker compose
# Application based on https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app
# Assume docker-compose is updated with the location of the image pushed below

export APP_DIR = "$HOME/Code/js-app/"

cd $APP_DIR

# Log into Docker Hub
docker login

# Build, tag, and push app image to Docker Hub
docker build -t my-app:latest .
docker tag my-app justintungonline/myapp:latest
docker push justintungonline/myapp:latest

docker compose -f docker-compose.yaml up
