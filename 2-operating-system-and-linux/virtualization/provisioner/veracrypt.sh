#!/bin/bash

set -e

echo "-- Veracrypt install starting"

wget https://launchpad.net/veracrypt/trunk/1.26.14/+download/veracrypt-console-1.26.14-Ubuntu-24.04-amd64.deb
sudo apt install ./veracrypt-console-1.26.14-Ubuntu-24.04-amd64.deb -y
rm ./veracrypt-console-1.26.14-Ubuntu-24.04-amd64.deb

echo "-- Veracrypt installed"
