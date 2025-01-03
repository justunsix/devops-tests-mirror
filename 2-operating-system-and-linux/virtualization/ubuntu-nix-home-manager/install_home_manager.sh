#!/usr/bin/env bash
# Install nix home-manager per
# https://nix-community.github.io/home-manager/index.xhtml

# Create a folder $HOME/.config/home-manager
mkdir -p /home/vagrant/.config/home-manager

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Replaced as home-manager now manages the shell as well
# Add . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" to bashrc \
# echo '$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh' >> /home/vagrant/.bashrc

# Remove default and replace with custom home.nix
rm /home/vagrant/.config/home-manager/home.nix

# Symlink /vagrant/home.nix to $HOME/.config/home-manager/home.nix
ln -s /vagrant/home.nix /home/vagrant/.config/home-manager/home.nix

# Install programs in home.nix and backup any existing files
home-manager switch -b backup