#!/bin/bash
set -e

echo "-- rustup install starting"

if ! command -v rustup &>/dev/null; then

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  $HOME/.cargo/bin/rustup component add rustfmt clippy rust-analyzer

fi

echo -e "-- rustup with rust-analyzer, clippy, rustfmt installed"
