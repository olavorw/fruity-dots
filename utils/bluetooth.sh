#!/bin/bash

set -e

if ! command -v bluetoothctl &>/dev/null; then
  echo "Installing Bluetooth..."
  sudo pacman -S --needed --noconfirm blueman bluez bluez-utils
fi

sudo systemctl enable --now bluetooth
