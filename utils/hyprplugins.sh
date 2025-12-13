#!/bin/bash

set -e

echo "Installing Hyprland plugins..."

hyprpm update

hyprpm add https://github.com/hyprwm/hyprland-plugins

hyprpm enable hyprexpo
hyprpm enable hyprscrolling
