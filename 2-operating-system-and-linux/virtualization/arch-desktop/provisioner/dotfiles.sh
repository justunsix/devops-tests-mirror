# Personal dotfiles settings
if [ -d "$HOME/Code/m/dotfiles" ]; then
    # Emacs Doom
    rm -rf ~/.config/doom
    mkdir -p ~/.config/doom
    cd ~/Code/m/dotfiles/.config/
    # Stow ~/Code/m/dotfiles/.config/doom to /home/vagrant/.config/doom
    stow --target=/home/vagrant/.config/doom doom

fi