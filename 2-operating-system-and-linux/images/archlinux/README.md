# Arch Linux Image Building

Explore building custom Archlinux images

## Usage

```sh
# Initializee
packer init .

# Format template
packer fmt .

# Validate
packer validate .

# Build image
packer build vm-arch.pkr.hcl

# Build image after changes and
# force deletion of existing artifacts
packer build -force vm-arch.pkr.hcl

# Use image
mkdir output2
cp package.box ./output2
cd output2
vagrant box add new-box name-of-the-packer-box.box
vagrant init new-box
vagrant up'
```

## See Also for Further Reading

- [A custom Vagrant box with Packer](https://dev.to/mattdark/a-custom-vagrant-box-with-packer-13ke)
- [Packer plugin for Vagrant and Documentation](https://github.com/hashicorp/packer-plugin-vagrant/tree/main)
- [Packer Tutorials - HashiCorp](https://developer.hashicorp.com/packer/tutorials)
  - [Packer Tutorial for Docker](https://developer.hashicorp.com/packer/tutorials/docker-get-started)
    covers concepts used in this folder
