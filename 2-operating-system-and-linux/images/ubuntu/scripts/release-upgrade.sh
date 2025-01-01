#!/bin/bash
set -e

echo "-- Release Upgrade starting"

do-release-upgrade -f DistUpgradeViewNonInteractive
echo "-- Rebooting after release upgrade"
reboot now

echo -e "-- Release Upgrade complete"
