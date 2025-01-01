# Ubuntu Image Building

Builds custom Ubuntu images using [packer](https://www.packer.io/).

## Pre-requisites

- See [Bento box building boxes requirements](https://github.com/chef/bento/tree/main?tab=readme-ov-file#building-boxes)

## Vagrant Images

Images are built using packer tempalte from [bento](https://github.com/chef/bento)

### bento-ubuntu-24.04-nix

Based on packer build of [bento/ubuntu-24.04](https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-24.04)
Vagrant image with additional installs of:

- [Nix](https://nixos.org/)

Makes access to many Linux packages easy.

### bento-ubuntu-24.04-nix-home-manager

Based on packer build of [bento/ubuntu-24.04](https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-24.04)
Vagrant image with additional installs of:

- [Nix](https://nixos.org/)
- [Nix home-manager](https://github.com/nix-community/home-manager) for vagrant user

Makes access to many Linux packages easy.

## Usage

```sh
# Get Bento packer files and configuration
# for building Ubuntu vagrant images
git clone https://github.com/chef/bento.git
cd bento

# Follow instructions per https://github.com/chef/bento/tree/main?tab=readme-ov-file
# Modify ./packer_templates/pkr-builder.pkr.hcl
# Include an extra steps in Ubuntu part of build, see example part below
# Copy extra scripts to packer_templates/scripts

packer init -upgrade ./packer_templates
cd packer_templates

# Format template
packer fmt .
# Validate, inspect errors, some unassigned variables are ok
packer validate .

cd ..
# Build for Ubuntu 24.04
packer build -only="virtualbox-iso.vm" -var-file="os_pkrvars/ubuntu/ubuntu-24.04-x86_64.pkrvars.hcl" ./packer_templates

# Use image
mkdir output2
cp builds/<box file>.box ./output2
cd output2
vagrant box add new-box <box file>.box
vagrant init new-box
vagrant up
```

### Example Part of Packer Template with Nix installation script added

```hcl
# bento/packer_templates/pkr-builder.pkr.hcl
# ...
              var.os_name == "ubuntu" ||
              var.os_name == "debian" ? [
                "${path.root}/scripts/${var.os_name}/update_${var.os_name}.sh",
                "${path.root}/scripts/_common/motd.sh",
                "${path.root}/scripts/_common/sshd.sh",
                "${path.root}/scripts/${var.os_name}/networking_${var.os_name}.sh",
                "${path.root}/scripts/${var.os_name}/sudoers_${var.os_name}.sh",
                "${path.root}/scripts/_common/vagrant.sh",
                "${path.root}/scripts/${var.os_name}/systemd_${var.os_name}.sh",
                "${path.root}/scripts/_common/virtualbox.sh",
                "${path.root}/scripts/_common/vmware_debian_ubuntu.sh",
                "${path.root}/scripts/_common/parallels.sh",
                "${path.root}/scripts/${var.os_name}/hyperv_${var.os_name}.sh",
                # Nix Installation script put after this line
                "${path.root}/scripts/nix.sh",
                "${path.root}/scripts/${var.os_name}/cleanup_${var.os_name}.sh",
                "${path.root}/scripts/_common/parallels_post_cleanup_debian_ubuntu.sh",
                "${path.root}/scripts/_common/minimize.sh"
                ]
# ...
```

### nix.sh installation script

Nix installation script is put near end of build
so most system software is already present.
There can be a `syntax error: unexpected "("`
error during the build and the nix installation command.
To fix it, [avoid using process substitution](https://discourse.nixos.org/t/how-to-install-multi-user-nix-on-alpine/13909)
by changing the usual nix install command to
[download the install file first and then run it](../../virtualization/ubuntu-desktop/provisioner/nix.sh).

## See Also for Further Reading

- [A custom Vagrant box with Packer](https://dev.to/mattdark/a-custom-vagrant-box-with-packer-13ke)
- [Packer plugin for Vagrant and Documentation](https://github.com/hashicorp/packer-plugin-vagrant/tree/main)
- [Packer Tutorials - HashiCorp](https://developer.hashicorp.com/packer/tutorials)
  - [Packer Tutorial for Docker](https://developer.hashicorp.com/packer/tutorials/docker-get-started)
    covers concepts used in this folder
