#!/bin/bash
set -e

# Creation of virtualenvs like for
# projects and Neovim Mason installs
apt install python3.12-venv

echo 'INSTALL_EDITOR="true"' | sudo tee -a /etc/environment
