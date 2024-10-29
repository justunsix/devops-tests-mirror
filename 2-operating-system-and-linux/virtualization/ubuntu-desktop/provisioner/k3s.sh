#!/bin/bash
set -e

curl -sfL https://get.k3s.io | sh -

# Allow others to see kubeconfig
chmod a+rw /etc/rancher/k3s/k3s.yaml

echo -e "-- k3s installed"
