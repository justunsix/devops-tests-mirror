# https://github.com/hashicorp/packer-plugin-vagrant/
packer {
  required_plugins {
    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "vagrant" "arch-nix-aur" {
  communicator = "ssh"
  source_path  = "archlinux/archlinux"
  provider     = "virtualbox"
  add_force    = true
}

source "vagrant" "arch-gui" {
  communicator = "ssh"
  source_path  = "archlinux/archlinux"
  provider     = "virtualbox"
  add_force    = true
}

build {
  sources = [
    "source.vagrant.arch-nix-aur",
    "source.vagrant.arch-gui"
  ]

  # Commands are run as root
  # Echoes the password 'vagrant'
  # Pipes it to sudo
  # Uses -S to read the password from stdin
  # Uses -E to preserve the environment variables
  # Executes the script using bash
  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/main-setup.sh"
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/nix.sh"
    only            = ["vagrant.arch-nix-aur"]
  }

  # Run as vagrant unprivileged user
  provisioner "shell" {
    script = "${path.root}/../../virtualization/arch-desktop/provisioner/AUR-helper.sh"
    only   = ["vagrant.arch-nix-aur"]
  }

  provisioner "shell" {
    script = "${path.root}/../../virtualization/arch-desktop/provisioner/nix-home-manager.sh"
    only   = ["vagrant.arch-nix-aur"]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/virtualbox-integration.sh"
    only            = ["vagrant.arch-gui"]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/xorg.sh"
    only            = ["vagrant.arch-gui"]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/desktop-gnome.sh"
    only            = ["vagrant.arch-gui"]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/arch-desktop/provisioner/sound.sh"
    only            = ["vagrant.arch-gui"]
  }

  provisioner "shell" {
    inline = ["echo === Provisioning Complete ==="]
  }

}


