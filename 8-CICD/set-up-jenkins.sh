#!/bin/bash

# Set up Jenkins on Docker in new Ubuntu server
# Install Docker
sudo apt update
sudo apt install docker.io

# Run Jenkins in detached mode
# Port 8080 for web access
# Port 50000 for master and worker nodes communications
# Use volume
docker run -p 8080:8080 -p 50000:50000 -d \
  -v jenkins_home:/var/jenkins_home \
  --restart=on-failure jenkins/jenkins:lts-jdk17
