#!/bin/bash
set -e

# Directory to store dotfiles and other projects
mkdir -p ~/Code
cd ~/Code
git clone https://github.com/justunsix/dotfiles.git

# Stow ~/Code/dotfiles/ to /home/vagrant/
cd dotfiles
stow --target=/home/vagrant/ .

# unstow
# stow --target=/home/justin --delete env

echo -e "-- Dotfiles Installed"

