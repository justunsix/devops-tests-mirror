#!/bin/bash
set -e

# Check if nix already installed, if not, do install
if ! command -v nix &>/dev/null; then
  echo -e "-- Installing nix, expect a lot of output"

  # Install nix
  # multi user installation with --daemon
  # --yes is to automatically agree to the installation
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes

  echo -e "-- nix install"

fi
