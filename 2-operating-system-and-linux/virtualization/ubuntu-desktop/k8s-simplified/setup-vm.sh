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
