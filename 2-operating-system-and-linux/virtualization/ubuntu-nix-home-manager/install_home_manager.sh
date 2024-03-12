#!/usr/bin/env bash
# Install nix home-manager per
# https://nix-community.github.io/home-manager/index.xhtml

# Create a folder $HOME/.config/home-manager
mkdir -p /home/vagrant/.config/home-manager
# Symlink /vagrant/home.nix to $HOME/.config/home-manager/home.nix
ln -s /vagrant/home.nix /home/vagrant/.config/home-manager/home.nix

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Add . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" to bashrc \
echo '$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh' >> /home/vagrant/.bashrc

# Install programs in home.nix
home-manager switch