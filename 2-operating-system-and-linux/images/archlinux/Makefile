SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY:
packer-fmt-and-validate: ## Format and validate packer HCL file
	packer fmt .
	packer validate .

run-archi-nix-aur: ## Build image, overwrite existing build image if present
	packer build --force --only vagrant.arch-nix-aur vm-arch.pkr.hcl

run-archi-gui: ## Build image, overwrite existing build image if present
	packer build --force --only vagrant.arch-gui vm-arch.pkr.hcl


