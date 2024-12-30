# https://github.com/hashicorp/packer-plugin-vagrant/
packer {
  required_plugins {
    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "vagrant" "archbox" {
  communicator = "ssh"
  source_path  = "archlinux/archlinux"
  provider     = "virtualbox"
  add_force    = true
}

build {
  sources = ["source.vagrant.archbox"]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Vagrant box",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }

  # Commands are run as root
  # Echoes the password 'vagrant'
  # Pipes it to sudo
  # Uses -S to read the password from stdin
  # Uses -E to preserve the environment variables
  # Executes the script using bash
  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/setup.sh"
  }

  provisioner "shell" {
    inline = ["echo Provisioning Complete"]
  }
}


