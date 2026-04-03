#!/bin/bash
set -e

sudo pacman -Sy --needed git base-devel --noconfirm
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo -e "-- yay Installed"
