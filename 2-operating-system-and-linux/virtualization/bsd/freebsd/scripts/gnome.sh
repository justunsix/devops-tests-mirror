#!/bin/sh

# Instructions from
# https://docs.freebsd.org/en/books/handbook/desktop/

pkg install -y gnome-lite

# GNOME requires /proc to be mounted
# Device                Mountpoint      FStype  Options         Dump    Pass
echo "proc               /proc           procfs  rw              0       0" >>/etc/fstab

# Enable D-BUS service in /etc/rc.conf to start at system boot
sysrc dbus_enable="YES"
# Enable GNOME Display Manager (GDM) in /etc/rc.conf to start at system boot
sysrc gdm_enable="YES"
