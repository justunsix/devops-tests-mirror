#!/bin/bash
set -e

# Install ansible and pip for any other required modules

apt install ansible -y
apt install pip -y

echo 'INSTALL_ANSIBLE="true"' | sudo tee -a /etc/environment
