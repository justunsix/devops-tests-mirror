#!/bin/bash
set -e

echo "-- System Updates starting"

apt update
apt upgrade -y

echo -e "-- System Updates complete"
