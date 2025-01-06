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
rm -rf "$HOME"/.config/lazyvim/lua/config/autocmds.lua
rm -rf "$HOME"/.config/lazyvim/lua/config/keymaps.lua
rm -rf "$HOME"/.config/lazyvim/lua/config/lazy.lua
rm -rf "$HOME"/.config/lazyvim/lua/config/options.lua
rm -rf "$HOME"/.config/lazyvim/lazyvim.json

# Stow ~/Code/dotfiles/ to /home/vagrant/
echo "Stowing dotfiles"
cd "$HOME/Code/dotfiles"
# Unstow existing if present
stow --target=/home/vagrant/ --delete .
stow --target=/home/vagrant/ .

# Install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo -e "-- Dotfiles Installed"
