#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo "Dotfiles Installation Script"
echo "========================================"
echo "Source directory: $DOTFILES_DIR"
echo "Target directory: $HOME"
echo ""

# Copy all files and directories from dotfiles root to home
echo "Installing dotfiles..."
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

SKIPPED=0
COPIED=0

shopt -s dotglob nullglob

for item in $DOTFILES_DIR/*; do
  BASENAME="$(basename "$item")"

  # Skip the install script itself
  if [ "$BASENAME" = "$(basename "$0")" ]; then
    echo "${YELLOW}[SKIP] $BASENAME (install script)${NC}"
    ((SKIPPED++))
    continue
  fi

  # Skip .git directory
  if [ "$BASENAME" = ".git" ]; then
    echo "${YELLOW}[SKIP] $BASENAME (git directory)${NC}"
    ((SKIPPED++))
    continue
  fi

  if [ "$BASENAME" = "README.md" ]; then
    echo "${YELLOW}[SKIP] $BASENAME (git directory)${NC}"
    ((SKIPPED++))
    continue
  fi

  if [ "$BASENAME" = "utils" ]; then
    echo "${YELLOW}[SKIP] $BASENAME (utils directory)${NC}"
    ((SKIPPED++))
    continue
  fi

  # Copy item to home directory
  echo "${BLUE}[COPY] $BASENAME${NC}"
  if cp -rv "$item" "$HOME/" 2>&1 | sed 's/^/       /'; then
    ((COPIED++))
  else
    echo "${RED}       ERROR: Failed to copy $BASENAME${NC}"
  fi
  echo ""
done

echo "========================================"
echo "Installation Summary"
echo "========================================"
echo "Items copied: $COPIED"
echo "Items skipped: $SKIPPED"
echo "Dotfiles installed successfully!"
