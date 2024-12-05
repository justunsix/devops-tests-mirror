#!/bin/bash
set -e

echo -e "-- Installing tools with nix"
nix-env -iA nixpkgs.stern nixpkgs.k9s nixpkgs.kubectx nixpkgs.git
