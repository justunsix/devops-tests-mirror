# Ubuntu Image Building

Builds custom Ubuntu images using [packer](https://www.packer.io/).

## Vagrant Images

Images are based on [Ubuntu / long term suppoort release](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu)
Vagrant image.

### ubuntu-noble64

Based on [ubuntu/jammy64](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/jammy64)
Vagrant image with additional installs of:

- Upgrades to [Ubuntu Noble Numbat LTS](https://ubuntu.com/desktop)

### ubuntu-noble64-nix

Based on [ubuntu/jammy64](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/jammy64)
Vagrant image with additional installs of:

- Upgrades to [Ubuntu Noble Numbat LTS](https://ubuntu.com/desktop)
  , reuses ubunut-lts image above
- [Nix](https://nixos.org/)
- [Nix home-manager](https://github.com/nix-community/home-manager)

Makes access to many Linux packages easy.

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
packer build --force --only vagrant.ubuntu-nix vm-ubuntu.pkr.hcl

# Use image
mkdir output2
cp output-ubuntu-nix/package.box ./output2
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
