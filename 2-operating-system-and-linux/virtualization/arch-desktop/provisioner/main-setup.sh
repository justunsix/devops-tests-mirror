#!/bin/bash
set -e

# Localisation configuration for Toronto, Canada
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
mv /etc/locale.gen /etc/locale.gen.old
echo -e "en_CA.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" > /etc/locale.gen
echo "LANG=en_CA.UTF-8" > /etc/locale.conf
locale-gen

# Track VM creation time
date > /etc/vagrant_provisioned_at

# Update system
pacman --noconfirm -Syyu

# pacman --noconfirm -S vim htop git hwinfo

# Before installing virtualbox packages, you need to remove -nox one
pacman --noconfirm -R virtualbox-guest-utils-nox && pacman --noconfirm -S virtualbox-guest-{utils,iso}
# dkms removed 2024-05-13, was previously
# pacman --noconfirm -S virtualbox-guest-{utils,dkms,iso}

echo -e "-- OS Localization, VirtualBox Integration and OS Update Complete"