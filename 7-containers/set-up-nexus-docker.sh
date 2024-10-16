#!/bin/bash

# Set up Docker and Nexus on a new Ubuntu server

# Install Docker
sudo apt update
snap install docker

# Use Nexus sonatype/nexus3 image from DockerHub
# Set up data volume for nexus
docker volume create --name nexus-data
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

# Verify Nexus is listening on 8081
ss -lntup
