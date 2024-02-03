# NixOS Vagrant Set up

Set up a NixOS VM using Vagrant using [nix box](https://github.com/nix-community/nixbox).

## Pre-requisites

- Vagrant, Virtualbox
- [vagrant-nixos-plugin](https://github.com/nix-community/vagrant-nixos-plugin)

## Usage

```sh
vagrant up
```

### With Makefile

```sh
# Install vagrant-nixos-plugin
make install 
# Start the VM
make run
```