#!/bin/bash

set -e

yay -S --needed --noconfirm clamav

sudo freshclam
