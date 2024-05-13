#!/bin/bash
set -e

# Optional - Sound configuration
pacman -S --noconfirm alsa-utils 
## unmute sound and set volume to 100%
## amixer sset Master 100%+ unmute
alsactl store
## PulseAudio seems to remove crackling sound, YMMV
## pacman -S --noconfirm pulseaudio pulseaudio-alsa

echo -e "-- Sound setup Complete"