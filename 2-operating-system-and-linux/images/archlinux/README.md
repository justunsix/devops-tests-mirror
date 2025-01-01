# Arch Linux Image Building

Builds custom Archlinux images using [packer](https://www.packer.io/).

## Vagrant Images

Images are based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image.

### arch-nix-aur

Based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image with additional installs of:

- [Nix](https://nixos.org/)
- [Nix home-manager](https://github.com/nix-community/home-manager)
- [yay AUR Helper](https://github.com/Jguer/yay)

Makes access to many Linux packages easy.

### arch-gui

Based on [archlinux/archlinux](https://portal.cloud.hashicorp.com/vagrant/discover/archlinux/archlinux)
Vagrant image with additional installs of:

- [GNOME desktop with Xorg](https://wiki.archlinux.org/title/GNOME),
- VirtualBox Guest Additions integration
- alsa sound

For a graphical user interface (GUI).

Also includes installs of:

- [Nix](https://nixos.org/)
- [Nix home-manager](https://github.com/nix-community/home-manager)
- [yay AUR Helper](https://github.com/Jguer/yay)

Makes access to many Linux packages easy.

Recommended minimal virtual machine settings: 2 CPU, 4 GB RAM, Video Ram 128 MB.

Vagrantfile example:

```ruby

Vagrant.configure("2") do |config|
  config.vm.box = "justunsix/archlinux-gui"

  # For graphical workloads
  config.vm.define "desktop-medium" do |desktopmedium|
    desktopmedium.vm.box = "justunsix/archlinux-gui"

    desktopmedium.vm.provider :virtualbox do |vb|
      # https://www.vagrantup.com/docs/providers/virtualbox/configuration
      vb.gui = true
      vb.name = "Archlinux_GUI"
      vb.linked_clone = true
      vb.check_guest_additions = true
      vb.memory = 4096
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--vram", "128"]

      # Enable bidirectional clipboard sharing
      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      # Enable bidirectional drag and drop
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      # Enable audio:
      # - dsound for Windows DirectSound
      vb.customize ["modifyvm", :id, "--audio-driver", "dsound"]
      # - alsa for Linux
      # vb.customize ["modifyvm", :id, "--audio-driver", "alsa"]
      # - coreaudio for macOS
      vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]
    end
  end
end
```

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
