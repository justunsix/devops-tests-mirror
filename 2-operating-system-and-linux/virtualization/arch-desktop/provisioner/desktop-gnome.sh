#!/bin/bash
set -e

# Per https://wiki.archlinux.org/title/GNOME

# GNOME Desktop and GNOME Display Manager (GDM)
pacman --noconfirm -S gnome gdm

# GNOME on Xorg session
echo "export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session" > /home/vagrant/.xinitrc
chown vagrant:vagrant /home/vagrant/.xinitrc 

# Start GDM
systemctl enable gdm
systemctl start gdm

echo -e "-- Gnome Desktop Installed"