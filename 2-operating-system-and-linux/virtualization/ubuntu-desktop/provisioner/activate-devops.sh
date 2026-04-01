#!/bin/bash
set -e

sudo apt install podman -y

echo 'INSTALL_DEVOPS="true"' | sudo tee -a /etc/environment
