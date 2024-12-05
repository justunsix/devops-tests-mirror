#!/bin/bash
set -e

if ! command -v kubectl &>/dev/null; then
  echo -e "-- Installing k3s"
  curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
  # Point kubeconfig to k3s
  echo "export KUBECONFIG='/etc/rancher/k3s/k3s.yaml'" >>/home/vagrant/.bashrc
  # Set k9s to read from k3s kubeconfig by default
  echo 'alias k9s="k9s --kubeconfig /etc/rancher/k3s/k3s.yaml"' >>/home/vagrant/.bashrc

  echo 'alias k="kubectl"' >>/home/vagrant/.bashrc

  echo -e "-- k3s installed"
  echo -e "-- WARNING, not recommended for production use - k3 Server running in -write-kubeconfig-mode to allow vagrant user read on k3s kubeconfig at /etc/rancher/k3s/k3s.yaml"

fi

# Check if nix already installed, if not, do install
if ! command -v nix &>/dev/null; then
  echo -e "-- Installing nix, expect a lot of output"

  # Install nix
  # multi user installation with --daemon
  # --yes is to automatically agree to the installation
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes

  echo -e "-- nix install"

fi
