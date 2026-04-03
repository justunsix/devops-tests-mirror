set -e

echo "-- Dotfiles and LazyVim Installs Starting"

DOTFILES_DIR="$HOME/.dots/dotfiles"

rm -rf ~/.config
rm -rf "$HOME/.dots/dotfiles"
git clone https://github.com/justunsix/dotfiles.git "$DOTFILES_DIR"
git clone https://github.com/LazyVim/starter ~/.config/nvim-lazyvim
rm -f "$HOME/.config/nvim-lazyvim/lua/config/autocmds.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/keymaps.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/lazy.lua"
rm -f "$HOME/.config/nvim-lazyvim/lua/config/options.lua"
rm -f "$HOME/.bashrc"
rm -f "$HOME/.bash_profile"

cd "$HOME/.dots" || exit
stow -t ~ dotfiles

config_nu_nix="$DOTFILES_DIR/.config/nushell/config-nix.nu"
config_nu="$DOTFILES_DIR/.config/nushell/config.nu"
config_env="$DOTFILES_DIR/.config/nushell/env.nu"

# Delete existing lines in nu config with unneeded programs
sed -i '/broot/d' "$config_nu_nix"
sed -i '/mise/d' "$config_nu"
sed -i '/mise/d' "$config_env"

echo "-- Dotfiles and LazyVim install complete"
