SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY:
bento-packer-fmt-and-validate: ## Check Bento packer files
	cd ~/Code/bento/packer_templates
	packer fmt .
	packer validate .

.PHONY:
bento-init-for-build: ## Initialize for build
	cp ../../virtualization/ubuntu-desktop/provisioner/nix.sh ~/Code/bento/packer_templates/scripts/
	cp scripts/nix-home-manager.sh ~/Code/bento/packer_templates/scripts/
	echo "Modify the bento/packer_templates/...pkr.hcl build file for the appropriate image"
	cd ~/Code/bento/
	packer init -upgrade ./packer_templates

.ONESHELL:
run-bento-ubuntu-24-04: ## Build image for Ubuntu 24.04
	cd ~/Code/bento/
	packer build -only="virtualbox-iso.vm" -var-file="os_pkrvars/ubuntu/ubuntu-24.04-x86_64.pkrvars.hcl" ./packer_templates
