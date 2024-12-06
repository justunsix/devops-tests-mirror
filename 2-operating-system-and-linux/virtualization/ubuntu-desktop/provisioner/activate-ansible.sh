#!/bin/bash
set -e

apt install pipx -y

# Install Ansible and pywinrm to manage Windows machines
# as vagrant user
su - vagrant -c "pipx install --include-deps ansible"
su - vagrant -c "pipx install --include-deps pywinrm"

echo -e "-- Ansible and pywinrm installed"

echo 'INSTALL_ANSIBLE="true"' | sudo tee -a /etc/environment
