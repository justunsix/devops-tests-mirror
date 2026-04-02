# Vagrant Fedora Template

Forked from [vagrant-fedora-template by baroxx on GitHub](https://github.com/baroxx/vagrant-fedora) under MIT License.

Provides a vagrant template using Fedora with software provisioners for development purposes.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- Hypervisor (depending on the targeted virtualization) like libvirt, VirtualBox

For Fedora specific instructions, see [vagrant-fedora-template](https://github.com/baroxx/vagrant-fedora)

## Get Started

Start the virtual machine using "vagrant up" with predefined provisioners.

```sh
vagrant up --provider virtualbox --provision-with main,ansible,final
```

- Choose a provider and change the tools you want to install
- The provisioners are comma separated

## Provisioners

Set the provisioners when running. The provisioners are comma separated.

- main: Installs the graphical desktop Gnome
- final: Updates system and reboots
- ansible: Installs Ansible infrastructure as code tool

**For graphical environment, the main provisioner should always be set, as it installs the graphical components (gnome). The final provisioner installs the lates updates and reboots the system.**

For additional provisioners see [vagrant-fedora-template](https://github.com/baroxx/vagrant-fedora)

## Clean Up

Run `vagrant destroy` to remove the virtual machine.