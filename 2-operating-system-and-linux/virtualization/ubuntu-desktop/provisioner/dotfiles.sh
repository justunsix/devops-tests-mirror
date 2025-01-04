#!/bin/bash
set -e

# Create repositories for dotfiles
# and make sure stow will not symlink
# certain directories by creating them first
if [ ! -d "$HOME/Code/dotfiles" ]; then

  echo "Cloning dotfiles repo"
  # Directory to store dotfiles and other projects
  mkdir -p "$HOME/Code"
  cd ~/Code
  git clone https://github.com/justunsix/dotfiles.git

  echo "Creating tmux plugins directory"
  mkdir -p "$HOME/.config/tmux/plugins"

fi

# Remove existing lazyvim files for stow to replace them
rm -rf $HOME/.config/lazyvim/lua/config/autocmds.lua
rm -rf $HOME/.config/lazyvim/lua/config/keymaps.lua
rm -rf $HOME/.config/lazyvim/lua/config/lazy.lua
rm -rf $HOME/.config/lazyvim/lua/config/options.lua

# Stow ~/Code/dotfiles/ to /home/vagrant/
echo "Stowing dotfiles"
cd "$HOME/Code/dotfiles"
stow --target=/home/vagrant/ .

# unstow
# stow --target=/home/justin --delete env

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "-- Dotfiles Installed"
