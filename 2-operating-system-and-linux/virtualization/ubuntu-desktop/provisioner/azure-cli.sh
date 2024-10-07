#!/bin/bash
set -e

# Ensure any previous Ubuntu version is removed
apt remove azure-cli -y && apt autoremove -y

# Install using official site 
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo -e "-- Azure CLI Installed"