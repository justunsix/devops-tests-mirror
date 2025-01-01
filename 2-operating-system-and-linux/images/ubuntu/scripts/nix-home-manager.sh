#!/bin/bash
set -e

echo "-- Nix home-manager install starting"

# Switch to the vagrant user and run the rest of the script
su - vagrant -c "$(
  cat <<'EOF'
echo "-- Nix home-manager install starting"

# Check if home-manager already installed, if so skip
if ! command -v home-manager >/dev/null; then

  if ! command -v nix-channel >/dev/null; then
    # Source nix profile, assuming nix is already installed
    . /etc/profile.d/nix.sh
  fi

  # Add nixpkgs unstable channel
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable

  # Install nix home-manager per
  # https://nix-community.github.io/home-manager/index.xhtml

  # Create a folder $HOME/.config/home-manager
  mkdir -p /home/vagrant/.config/home-manager

  # Install home-manager
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install

fi

# Install programs in home.nix and backup any existing files
home-manager switch -b backup
EOF
)"

echo -e "-- Nix home-manager installed and next generation created"
