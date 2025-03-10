#!/bin/bash
set -e

# Check if nix already installed, if not, do install
if ! command -v nix &>/dev/null; then

  # Install nix
  pacman --noconfirm -Sy curl
  # multi user installation with --daemon
  # --yes is to automatically agree to the installation
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes

fi

echo -e "-- nix Installed"

