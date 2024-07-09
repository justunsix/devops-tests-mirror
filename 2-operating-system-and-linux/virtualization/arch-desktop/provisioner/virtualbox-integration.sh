#!/bin/bash
set -e

# Before installing virtualbox packages, you need to remove -nox one
pacman --noconfirm -R virtualbox-guest-utils-nox && pacman --noconfirm -S virtualbox-guest-{utils,iso}
# dkms removed 2024-05-13, was previously
# pacman --noconfirm -S virtualbox-guest-{utils,dkms,iso}

echo -e "-- VirtualBox Integration Complete"