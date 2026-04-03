#!/bin/bash
set -e

echo "-- GNOME Desktop install starting"

# Install desktop and virtualbox additions
apt-get install -y ubuntu-desktop build-essential dkms virtualbox-guest-utils virtualbox-guest-x11

# Permit anyone to start the GUI
sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config

echo -e "-- GNOME Desktop Installed"
