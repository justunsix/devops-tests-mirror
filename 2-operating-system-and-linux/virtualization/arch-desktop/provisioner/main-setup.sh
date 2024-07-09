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

echo -e "-- OS Localization and OS Update Complete"