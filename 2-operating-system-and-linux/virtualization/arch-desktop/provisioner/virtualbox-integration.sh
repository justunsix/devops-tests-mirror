#!/bin/bash
set -e

# Before installing virtualbox guest additions packages
# Need to remove -nox (no X support) one
# Reinstall -nox one for other support like Wayland
pacman --noconfirm -R virtualbox-guest-utils-nox && pacman --noconfirm -S virtualbox-guest-{utils,iso}
# dkms removed 2024-05-13, was previously
# pacman --noconfirm -S virtualbox-guest-{utils,dkms,iso}

echo -e "-- VirtualBox Integration Complete"

