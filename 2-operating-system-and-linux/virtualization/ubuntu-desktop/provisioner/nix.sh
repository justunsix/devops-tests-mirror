#!/bin/bash
set -e

echo "-- Nix install starting"

# Check if nix already installed, if not, do install
if ! command -v nix &>/dev/null; then

  # Install nix
  apt install curl -y
  # multi user installation with --daemon
  # --yes is to automatically agree to the installation
  # Workaround for Syntax error: unexpected "("` issue per:
  # https://discourse.nixos.org/t/how-to-install-multi-user-nix-on-alpine/13909
  curl -L https://nixos.org/nix/install >install
  sh install --daemon --yes
  # sh <(curl -L https://nixos.org/nix/install) --daemon --yes
  rm install

fi

echo -e "-- nix installed"
