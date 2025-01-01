# Arch Linux Image Building

Builds custom Archlinux images using [packer](https://www.packer.io/).

## Vagrant Images

Images are based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image.

### arch-nix-aur

Based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image with additional installs of Nix, Nix home-manager, and yay AUR Helper
making access to many Linux packages easy.

### arch-gui

Based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image with additional installs of GNOME desktop with Xorg,
VirtualBox Guest Additions integration, and alsa sound for a
graphical user interface (GUI).
Also includes Nix, Nix home-manager, and yay AUR Helper
making access to many Linux packages easy.

Minimal virtual machine settings: 2 CPU, 4 GB RAM, Video Ram 128 MB

#### Login Username and Password

- Username: vagrant
- Password: vagrant

## Usage

```sh
# Initializee
packer init .

# Format template
packer fmt .

# Validate
packer validate .

# Build image with nix and AUR helper
# force deletion of existing artifacts
packer build --force --only vagrant.arch-nix-aur vm-arch.pkr.hcl

# Use image
mkdir output2
cp output-arch-nix-aur/package.box ./output2
cd output2
vagrant box add new-box package.box
vagrant init new-box
vagrant up
```

## See Also for Further Reading

- [A custom Vagrant box with Packer](https://dev.to/mattdark/a-custom-vagrant-box-with-packer-13ke)
- [Packer plugin for Vagrant and Documentation](https://github.com/hashicorp/packer-plugin-vagrant/tree/main)
- [Packer Tutorials - HashiCorp](https://developer.hashicorp.com/packer/tutorials)
  - [Packer Tutorial for Docker](https://developer.hashicorp.com/packer/tutorials/docker-get-started)
    covers concepts used in this folder
