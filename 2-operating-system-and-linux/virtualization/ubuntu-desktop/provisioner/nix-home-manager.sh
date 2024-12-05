#!/bin/bash
set -e

# Check if home-manager already installed, if so skip
if ! command -v home-manager >/dev/null; then

  # Add nixpkgs unstable channel
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable

  # Install nix home-manager per
  # https://nix-community.github.io/home-manager/index.xhtml

  # Create a folder $HOME/.config/home-manager
  mkdir -p /home/vagrant/.config/home-manager

  # Install home-manager
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install

  # Remove default and replace with custom home.nix
  rm /home/vagrant/.config/home-manager/home.nix

  # Symlink nix configuration
  ln -s /vagrant/home.nix /home/vagrant/.config/home-manager/home.nix
  ln -s /vagrant/nix-modules /home/vagrant/.config/home-manager/nix-modules

fi

# Install programs in home.nix and backup any existing files
home-manager switch -b backup

echo -e "-- home-manager Installed and Next generation created"

