#!/bin/bash

set -e

paru -S --needed --noconfirm clamav

sudo freshclam
