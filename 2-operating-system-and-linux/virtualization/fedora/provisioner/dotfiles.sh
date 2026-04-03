set -e

echo "-- Dotfiles and LazyVim Installs Starting"

rm -rf ~/.config
rm -rf ~/Code
mkdir ~/Code
cd ~/Code || exit
git clone https://github.com/justunsix/dotfiles.git
git clone https://github.com/LazyVim/starter ~/.config/nvim-lazyvim
rm -f "$HOME/.config/nvim-lazyvim/lua/config/autocmds.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/keymaps.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/lazy.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/options.lua"
stow -t ~ dotfiles

config_nu_nix="$HOME/Code/dotfiles/.config/nushell/config-nix.nu"
config_nu="$HOME/Code/dotfiles/.config/nushell/config.nu"
config_env="$HOME/Code/dotfiles/.config/nushell/env.nu"

# Delete existing lines in nu config with unneeded programs
sed -i '/broot/d' "$config_nu_nix"
sed -i '/mise/d' "$config_nu"
sed -i '/mise/d' "$config_env"

echo "-- Dotfiles and LazyVim install complete"
