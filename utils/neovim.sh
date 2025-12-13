#!/bin/bash

set -e

if ! command -v git &>/dev/null; then
  echo "Installing git..."
  sudo pacman -S --needed --noconfirm git
fi

echo "Cloning Neovim config..."
git clone "https://github.com/olavorw/nvim.git" "$HOME/.config/nvim"
echo "Neovim config installed"
