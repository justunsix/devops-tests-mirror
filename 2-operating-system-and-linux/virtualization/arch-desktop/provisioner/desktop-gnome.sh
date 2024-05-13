#!/bin/bash
set -e

# Per https://wiki.archlinux.org/title/GNOME

pacman --noconfirm -S gnome gdm

echo "export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session" > /home/vagrant/.xinitrc
chown vagrant:vagrant /home/vagrant/.xinitrc 

systemctl enable gdm
systemctl start gdm

echo -e "-- Gnome Desktop Installed"