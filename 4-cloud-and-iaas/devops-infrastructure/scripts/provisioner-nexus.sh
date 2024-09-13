# Script to set up Ubuntu Server for Nexus Repository Manager
# Run with sudo privileges

apt update
apt upgrade -y

# Prerequisites
## Java JDK 17 as of version 3.71.0
## https://help.sonatype.com/en/sonatype-nexus-repository-system-requirements.html
apt install openjdk-17-jdk -y

# Get Nexus Repository Manager
## from https://help.sonatype.com/en/download.html
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.72.0-04-unix.tar.gz
tar -zxvf nexus-3.72.0-04-unix.tar.gz

