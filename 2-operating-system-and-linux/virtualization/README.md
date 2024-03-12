# DevOps: Virtualization

This directory contains `Vagrantfile`s for different virtual machines.

- In this directory, `Vagrantfile` creating an Ubuntu virtual machine (VM) with some Nix packages installed.
  - In `ubuntu-nix-home-manager` directory, a similar virtual machine in the `Vagrantfile` except uses [home-manager](https://github.com/nix-community/home-manager) and home.nix configuration file to set which programs to install instead of putting in Ansible playbook
- In `nixos` directory, `Vagrantfile` creating a NixOS VM
- In `ubuntu-desktop` directory, `Vagrantfile` creating an Ubuntu VM with a desktop graphical user interface (GUI) environment


VMs can be used as a base to install other software in the VM.

## Prerequisites

Before you begin, ensure you have met the following requirements installed:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)

## Usage

To use this project, follow these steps:

- Clone or download this repository to your computer.
- Navigate to the directory containing the `Vagrantfile`.
- Run the command `vagrant up` to start the virtual machine.
- Once the machine is up and running, you can use `vagrant ssh` to connect to it.
- When done, use `vagrant halt` to turn off the machine.
- To clean up and remove the machine, use `vagrant destroy`. This step will remove the machine and all its data.

### About the Ubuntu Vagrantfile

- Sets up a virtual machine (VM) with Ubuntu ("ubuntu/jammy64" box)
- The VM's hostname is set to "ubuntu".
- It copies certain configuration files from the host machine to the VM
- It installs Ansible within the VM and uses it with a playbook to further set up the VM with software

#### How to Build on the Vagrantfile

- The copying of configuration files and playbooks are areas to build on to share more files with the VM and install more software

## See Also

- Windows:
  - [gusztavvargadr / workstations](https://github.com/gusztavvargadr/workstations) for development Windows Virtual Machines
  - [gusztavvargadr / packer Wiki](https://github.com/gusztavvargadr/packer/wiki) for ready to use images
- Ubuntu Desktops:
  - [Aufbau-einer-Smarthome-Security-Umgebung](https://github.com/Simon-Str/Aufbau-einer-Smarthome-Security-Umgebung) - VM configured with Ubuntu, GUI interface, and Ansible playbook.
  - [ubuntu-config-scripts](https://github.com/yaphott/ubuntu-config-scripts)
  - [vagrant-ubuntu-desktop](https://github.com/Emna-Cheniour/vagrant-ubuntu-desktop/tree/main) - VM configured with Ubuntu, GUI interface, and other customizations for development purposes
