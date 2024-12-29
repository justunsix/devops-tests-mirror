#!/bin/bash
set -e

pacman -Syu hyprland --noconfirm

# per https://wiki.hyprland.org/Getting-Started/Installation
# Install:
# - kitty as default terminal
# - mesa OpenGL drivers should already be installed
pacman -S mesa kitty --noconfirm

# Replace VirtualBox guest additions with no X support one
# Agree to replacement
pacman -S virtualbox-guest-utils-nox --noconfirm

echo -e "-- LazyVim Installed"
