#!/bin/bash
set -e

echo "-- Brew Installs starting"

install_programs() {

  brew install nushell carapace starship topgrade yazi

}

install_programs

echo -e "-- Brew Installs complete"
