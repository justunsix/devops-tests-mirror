#!/bin/bash
set -e

echo "-- Nix install starting"

# Check if nix already installed, if not, do install
if ! command -v nix &>/dev/null; then

  # Install nix
  apt install curl -y
  # multi user installation with --daemon
  # --yes is to automatically agree to the installation
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes

fi

echo -e "-- nix installed"
