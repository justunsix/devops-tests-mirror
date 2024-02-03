SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install NixOS vagrant plugin
	vagrant plugin install vagrant-nixos-plugin

run: ## Run NixOS Virtual Machine
	vagrant up

init: install ## Create Vagrantfile for NixOS Virtual Machine if not present
	vagrant init nixbox/nixos --box-version 23.11

clean: ## Destroy NixOS Virtual Machine
	vagrant destroy