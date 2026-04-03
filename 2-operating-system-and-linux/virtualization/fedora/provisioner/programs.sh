#!/bin/bash
set -e

base() {
  dnf install git atuin bat zoxide stow -y
}

# Editor related
editor() {
  # Editors
  dnf install neovim helix -y
  # LazyVim requirements https://www.lazyvim.org/
  dnf install tree-sitter-cli curl fzf ripgrep fd-find -y
}

brew() {

  # Install Homebrew's dependencies
  dnf group install development-tools -y
}

echo "-- Program Installs starting"

base
editor

echo -e "-- Program Installs complete"
