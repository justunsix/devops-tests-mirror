#!/bin/bash
set -e

if ! [ -d "$HOME/.config/nvim" ]; then
    git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
fi