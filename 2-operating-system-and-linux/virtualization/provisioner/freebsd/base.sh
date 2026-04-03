#!/bin/sh

freebsd-update
pkg install -y nushell helix git stow helix broot yazi starship carapace atuin broot

# Editor setup
# LazyVim required and optional packages
# https://www.lazyvim.org/
sudo pkg install -y lazygit tree-sitter-cli curl fzf ripgrep fd-find neovim
