# Script to set up Ubuntu Server for Nexus Repository Manager
# Run with sudo privileges

export NEXUS_SF_VERSION="nexus-3.72.0-04"
export NEXUS_VERSION="${NEXUS_SF_VERSION}-unix"

apt update
apt upgrade -y

# Install network tools including netstat
apt install net-tools -y

# Prerequisites
## Java JDK 17 as of Nexus version
## https://help.sonatype.com/en/sonatype-nexus-repository-system-requirements.html
apt install openjdk-17-jdk -y

# Get Nexus Repository Manager
## from https://help.sonatype.com/en/download.html
cd /opt
wget https://download.sonatype.com/nexus/3/$NEXUS_VERSION.tar.gz
tar -zxvf $NEXUS_VERSION.tar.gz

# Create Nexus application user
## Set password, leave other defaults
adduser nexus

# Change ownership of Nexus folders to nexus user
chown -R nexus:nexus /opt/sonatype-work
chown -R nexus:nexus /opt/$NEXUS_SF_VERSION

# Set user in Nexus
sed -i 's/#run_as_user=""/run_as_user="nexus"/g' /opt/$NEXUS_SF_VERSION/bin/nexus.rc

# Start Nexus as nexus user
su - nexus -c "/opt/$NEXUS_SF_VERSION/bin/nexus start &"

# Check Nexus is running
netstat -lnpt