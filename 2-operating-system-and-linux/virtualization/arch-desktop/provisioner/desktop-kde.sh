#!/bin/bash
set -e

# Install desktop environment / display manager
# Option - fluxbox
# pacman --noconfirm -S fluxbox awesome && echo startfluxbox > /home/vagrant/.xinitrc
# Option - If someone likes kde: 
pacman --noconfirm -S plasma-desktop konsole dolphin kscreen && echo startplasma-x11 > /home/vagrant/.xinitrc
chown vagrant:vagrant /home/vagrant/.xinitrc 
# it looks like at this stage there is no /home/vagrant, so making .xinitrc may be required to be done manually

# Set up Simple Desktop Display Manager (SDDM) login screen for X11 and Wayland
pacman --noconfirm -S sddm
systemctl enable sddm
systemctl start sddm

echo -e "-- KDE Desktop Installed"