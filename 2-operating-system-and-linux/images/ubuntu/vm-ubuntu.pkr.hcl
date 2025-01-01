# https://github.com/hashicorp/packer-plugin-vagrant/
packer {
  required_plugins {
    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "vagrant" "ubuntu-lts" {
  communicator = "ssh"
  source_path  = "ubuntu/jammy64"
  provider     = "virtualbox"
  add_force    = true
}

source "vagrant" "ubuntu-nix" {
  communicator = "ssh"
  source_path  = "ubuntu/jammy64"
  provider     = "virtualbox"
  add_force    = true
}

build {
  sources = [
    "source.vagrant.ubuntu-lts",
    "source.vagrant.ubuntu-nix"
  ]

  # Commands are run as root
  # Echoes the password 'vagrant'
  # Pipes it to sudo
  # Uses -S to read the password from stdin
  # Uses -E to preserve the environment variables
  # Executes the script using bash
  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/release-upgrade.sh"
    pause_after     = "30s"
    # Wait for reboot after this provisioner step
    expect_disconnect = "true"
    only              = ["vagrant.ubuntu-lts"]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/ubuntu-desktop/provisioner/main-setup.sh"
    # In case reboot takes longer than expected
    expect_disconnect = "true"
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "${path.root}/../../virtualization/ubuntu-desktop/provisioner/nix.sh"
    only            = ["vagrant.ubuntu-nix"]
  }

  # Run as vagrant unprivileged user
  provisioner "shell" {
    script = "${path.root}/../../virtualization/ubuntu-desktop/provisioner/nix-home-manager.sh"
    only   = ["vagrant.ubuntu-nix"]
  }

  provisioner "shell" {
    inline = ["echo === Provisioning Complete ==="]
  }

}


