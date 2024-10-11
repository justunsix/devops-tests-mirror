#!/bin/bash

# Set up application and run its Docker compose
# Application based on https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app

export APP_DIR="$HOME/Code/js-app/"

cd $APP_DIR

echo "-- Updating default settings in js-app application"
echo "- Use Docker hub image and docker compose database connection string"

# Replace location of my-app image to point to Docker Hub image
sed -i 's/# my-app:/my-app:/g' docker-compose.yaml
sed -i 's/# image: ${docker-registry}\/my-app:1.0/image: justintungonline\/myapp:latest/g' docker-compose.yaml
sed -i 's/# ports:/ports:/g' docker-compose.yaml
sed -i 's/# - 3000:3000/- 3000:3000/g' docker-compose.yaml

# Replace instances of local development DB connection string
# with one for Docker compose mongodb service name
sed -i 's/mongoUrlLocal/mongoUrlDockerCompose/g' app/server.js
# Remove old line
sed -i '/let mongoUrlDockerCompose = "mongodb:\/\/admin:password@localhost:27017"/d' app/server.js

# Log into Docker Hub
docker login

echo "-- Build, tag, and push app image to Docker Hub"
docker build -t my-app:latest .
docker tag my-app justintungonline/myapp:latest
docker push justintungonline/myapp:latest

echo "-- Starting app and database with docker compose"
echo "Access the application at http://localhost:3000/"
echo "Access mongo-express at http://localhost:8081/ with admin:pass"
echo "For app to work, in mongo-express, do: "
echo "- Add database: users-account"
echo "- Add collection: users"
docker compose -f docker-compose.yaml up -d
