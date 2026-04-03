#!/bin/bash
set -e

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

echo -e "-- k3s installed"
echo -e "-- WARNING, not recommended for production use - k3 Server running in -write-kubeconfig-mode to allow vagrant user read on k3s kubeconfig at /etc/rancher/k3s/k3s.yaml"
