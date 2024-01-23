# DevOps: Virtualization

This directory contains a `Vagrantfile` that is configured to run an Ubuntu virtual machine (VM) with some Nix packages installed.

It can be used as a base to install other software in the VM. 

## Prerequisites

Before you begin, ensure you have met the following requirements installed:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)

## Usage

To use this project, follow these steps:

- Clone or download this repository to your local machine.
- Navigate to the directory containing the `Vagrantfile`.
- Run the command `vagrant up` to start the virtual machine.
- Once the machine is up and running, you can use `vagrant ssh` to connect to it.
- When done, use `vagrant halt` to turn off the machine.

## About the Vagrantfile

- Sets up a virtual machine (VM) with Ubuntu ("ubuntu/jammy64" box)
- The VM's hostname is set to "ubuntu".
- It copies certain configuration files from the host machine to the VM
- It install Ansible within the VM and uses it with a playbook to further set up the VM with software

### How to Build on the Vagrantfile

- The copying of configuration files and playbooks are areas to build on to share more files with the VM and install more software