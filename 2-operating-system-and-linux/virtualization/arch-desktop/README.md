# ArchLinux Desktop

Provides a vagrant template to run an ArchLinux virtual machine with provisioners.
Provisioners can add GNOME, KDE desktop or command line only environments.

For a simple `Vagrantfile` to run an ArchLinux desktop environment with KDE,
see the `kde` folder.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  - Optional: Set up GPU pass through for VirtualBox
    - [Windows instructions](https://www.xda-developers.com/how-use-gpu-virtualbox/)

## Get Started

Start the virtual machine using `vagrant up` with selected provisioners.

This example starts the virtual machine with GNOME desktop environment
and sound support.

```sh
# desktopvm - name of the virtual machine defined in Vagrantfile
# --provider virtualbox - use VirtualBox as the provider
# --provision-with - run the selected provisioners in the
#                    order specified which are shell scripts
#                    to configure the system and
#                    install packages
vagrant up desktopvm --provider virtualbox --provision-with main-setup,virtualbox-integration,xorg,gnome,sound
```

See the [Makefile](Makefile) for more examples running the different
virtual machines with different provisioners.

## Provisioners

The provisioners are comma separated. See `Makefile` for
examples to run.

- `main-setup`: Sets locale, time zone, installs VirtualBox guest additions,
  and updates the system
- `xorg`: Installs Xorg server
- `gnome`: Installs GNOME desktop environment
- `kde`: Installs KDE desktop environment
- `sound`: Installs and fixes sound issues in the virtual machine
- `nix`: Install Nix package manager
- `nix-home-manager`: Install Nix Home Manager

## Clean Up

Run `vagrant destroy` to remove the virtual machine.
