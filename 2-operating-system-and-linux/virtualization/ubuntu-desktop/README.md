# About this Virtual Machine

A modular virtual machine (VM) using an Ubuntu image.

## Use Cases

Can be used to construct Ubuntu VMs that serves these purposes:

- Desktop with GNOME graphical use interface
- Command line only VM
- VM used for development or operations with development and operations (DevOps)
  tools installed
- Small Kubernetes (K8s) cluster
- VM with Ansible to manage itself or other machines
- VM with any combination of the above options

The `Vagrantfile` contains different provisioners for a modular way of building the
VM using the vagrant command `--provision-with` option

Optional provisioners in the `Vagrantfile` allow calling those provisioners
during the VM creation. See the `Makefile` for examples

## Pre-requisites

Before you begin, ensure you have met the following requirements installed:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- Your system (host machine of the VM) should have the required RAM
  indicated in the `Vagrantfile`. For example, a development VM with K8s
  should have 2 GB RAM available for use by the VM. The GNOME Desktop
  option should have 4 GB RAM available.
  - If running command line only programs, the 1 GB default of the
    image is enough and you can modify the `Vagrantfile` and remove
    the memory setting.

## Usage

Start the virtual machine

```sh

# Run the virtual machine with GNOME Desktop
vagrant up desktopvm --provider virtualbox --provision-with main-setup,gnome
# Open VirtualBox to see and use the GUI

# Run the virtual machine as CLI only multiple provisioners
vagrant up cli-micro --provider virtualbox --provision-with main-setup,activate-editor,activate-devops,activate-ansible,nix,nix-home-manager,lazyvim,k3s
# SSH into VM
vagrant ssh

```

## About provisioners

- Common programs will be installed using Ubuntu packages like GNOME and curl
- Programs where possible are installed using [nix](https://nixos.org/)
  and [nix home-manager](https://github.com/nix-community/home-manager)
  - Environment variables help nix determine which sets of programs to install.
    Details are in [home.nix](home.nix)
- Other programs or frameworks are installed using their recommended
  installation programs

See the [provisioner folder](./provisioner/) for details.

## Troubleshooting the Vagrantfile and Ubuntu Desktop

- When running `vagrant up`
  - May require some interrupts if it hangs on the Virtualbox additions installation
    - If so, interrupt the `vagrant up` command and run
      `vagrant reload --provision` to continue install
- For the graphical desktop VM, Virtualbox guest additions may be re-installed during initial boot ups.
  If so, reboot until screen scaling and clipboard sharing works.
