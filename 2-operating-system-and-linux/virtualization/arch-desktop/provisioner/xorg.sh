#!/bin/bash
set -e

# Install X.Org server, graphical packages
pacman --noconfirm -S \
                      xorg-server{,-common,-xwayland} \
                      xorg-xinit \
                      xf86-video-{fbdev,vesa} \
                      xorg-xcalc xterm xorg-xrandr
# 2024-05-13: xrandr renamed to xorg-xrandr

# Add vagrant user to video group
gpasswd -a vagrant video

echo -e "-- X Org Installed"