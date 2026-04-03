#!/bin/bash
set -e

echo "-- Brew Install starting"

install_brew() {

  if ! [ -d /home/linuxbrew/.linuxbrew/bin ]; then
    /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo >>/home/vagrant/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >>/home/vagrant/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

  fi

}

echo -e "-- Brew Install complete"
