#!/usr/bin/env bash

# Create and run a NixOS virtual machine on VirtualBox
# using https://nix.dev/tutorials/nixos/nixos-configuration-on-vm

# Use reproducible build
nix-shell -I nixpkgs=channel:nixos-23.11 -p 'let pkgs = import <nixpkgs> { config = {}; overlays = []; }; iso-config = pkgs.path + /nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix; gnome-nixos = pkgs.nixos iso-config; in gnome-nixos.config.system.build.nixos-generate-config'

# Create a directory for configuration.nix
nixos-generate-config --dir ./