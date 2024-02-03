SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Create NixOS Virtual Machine from congifuration.nix with 23.11 version
	nix-build '<nixpkgs/nixos>' -A vm \
	-I nixpkgs=channel:nixos-23.11 \
	-I nixos-config=./configuration.nix

run: ## Run NixOS Virtual Machine
	./result/bin/run-nixos-vm

clean-after-configuration-change: ## Remove dynamic disk image state file on configuration change
	rm -f nixos.qcow2