# ArchLinux Desktop

Provides a vagrant template to run an ArchLinux desktop environment using GNOME and/or KDE.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Get Started

Start the virtual machine using "vagrant up" with selected provisioners.

This example starts the virtual machine with GNOME desktop environment and sound support.

```sh
vagrant up --provider virtualbox --provision-with main-setup,xorg,gnome,sound
```

## Provisioners

The provisioners are comma separated. See `Makefile` for examples to run.

- `main-setup`: Sets locale, time zone, installs VirtualBox guest additions, and updates the system
- `xorg`: Installs Xorg server
- `gnome`: Installs GNOME desktop environment
- `kde`: Installs KDE desktop environment
- `sound`: Installs and fixes sound issues in the virtual machine

## Clean Up

Run `vagrant destroy` to remove the virtual machine.
