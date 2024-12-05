# About this Virtual Machine (VM)

- Runs a Kubernetes (K8s) instance using [k3s](https://k3s.io/)
  inside a virtual machine.

## Use Case

Allows you to get started with a small k8s cluster to
experiment with and develop on any operating system.

## Tooling

- Installs tools for working with the k8s cluster and
  containers like:
  - kubectl (installs with k3s install)
  - stern for logs
  - kubectx for contexts, namespaces
  - git
  - docker (installed with vagrant provisioner)

## Pre-requisites

Before you begin, ensure you have met the following requirements installed:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- Your system (host machine of the VM) should have at least
  2 GB RAM available for use by the VM.

## Usage

Start the virtual machine

```sh
# Start VM
vagrant up
# SSH into VM
vagrant ssh
# Kubernetes will already be running
```

Example further commands:

```sh
# See nodes
kubectl get node

# View k9s TUI
k9s
~~
```

- Use `kubectl` to manage the cluster. In the VM, `kubectl`
  is aliased to `k` for convenience.
- Use `k9s` to browse the cluster, nodes, and other k8s components.
  - k9s has been aliased to always use the k3s kubeconfig.
    See the `setup-tools.sh` for details.
- If you make changes to the setup VM and tool bash scripts,
  re-provision the VM with `vagrant reload --provision`.
  For example, you may want to add more tools and shell
  configuration to the VM.
- `kubectx` will not work by default since the kubeconfig
  is only writable by root. Permissions can be changed
  but will be reset on each VM restart.

## Extending the VM

- Add ports to the VM to see containers from the host machine
- Add more tools
- Use containers in the VM for development
- If you need more tools and options, see the `Vagrantfile` and
  [README in the parent directory](../README.md) which offers
  a modular setup to the VM.
