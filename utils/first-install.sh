#!/bin/bash

set -e

echo "Installing the basics..."

# Install AUR helper
echo "Installing yay..."
./install-yay.sh

# Install dependencies
echo "Installing dependencies..."
./install-dependencies.sh

# Get the dotfiles copied over
echo "Copying dotfiles..."
../updater.sh

# Enable pcscd for smart cards
sudo systemctl enable pcscd

# Fonts
echo "Installing fonts..."
./install-sf-pro-fonts.sh

# Flatpak
echo "Installing Flatpaks..."
./flatpak.sh

# Tailscale
echo "USER ACTION REQUIRED: Set up Tailscale!"
./tailscale.sh

# Neovim config
echo "Cloning Neovim config..."
./neovim.sh

# Zsh plugins
echo "Installing Zsh plugins..."
./zsh.sh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Firewall
echo "Activating firewall..."
./ufw.sh

# Papirus folders
echo "Setting Papirus folder colors..."
./papirus.sh

# SSH
echo "Setting up SSH..."
./ssh.sh

# Bluetooth
echo "Setting up Bluetooth..."
./bluetooth.sh

# ClamAV
echo "Installing ClamAV..."
./clamav.sh

# Spotify
echo "Setting up Spotify..."
./spotify.sh &

# Syncthing
echo "Setting up Syncthing..."
./syncthing.sh

# Templates
echo "Templates"
./templates.sh
