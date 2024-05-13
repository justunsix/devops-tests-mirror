#!/bin/bash
set -e

# Install nix
pacman --noconfirm -S curl
# multi user installation with --daemon
# --yes is to automatically agree to the installation
sh <(curl -L https://nixos.org/nix/install) --daemon --yes

echo -e "-- nix Installed"