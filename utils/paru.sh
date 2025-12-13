#!/bin/bash

# Install paru AUR helper

set -e

# Check if paru is already installed
if command -v paru &>/dev/null; then
  echo "paru is already installed"
  exit 0
fi

# Install base-devel and git if not present
sudo pacman -S --needed --noconfirm base-devel git

# Clone paru repository
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru

# Build and install
makepkg -si --noconfirm

# Clean up
cd ..
rm -rf paru

echo "paru installed successfully"
