#!/bin/bash

# Set up application and run its Docker compose
# Application based on https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app
# Assume docker-compose is updated with the location of the image pushed below

export APP_DIR="$HOME/Code/js-app/"

cd $APP_DIR

# Replace instances of local development DB connection string
# with one for Docker compose mongodb service name
sed -i 's/mongoUrlLocal/mongoUrlDockerCompose/g' app/server.js
# Remove old line
sed -i '/let mongoUrlDockerCompose = "mongodb:\/\/admin:password@localhost:27017"/d' app/server.js

# Log into Docker Hub
docker login

# Build, tag, and push app image to Docker Hub
docker build -t my-app:latest .
docker tag my-app justintungonline/myapp:latest
docker push justintungonline/myapp:latest

# Run application with database
# Access the application at http://localhost:3000/
# Access mongo-express at http://localhost:8081/
# For app to work, in mongo-express, do:
# - Add database: users-account
# - Add collection: users
docker compose -f docker-compose.yaml up
