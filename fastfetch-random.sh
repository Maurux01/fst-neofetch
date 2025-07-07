#!/bin/bash

# Get the username dynamically
USER=$(whoami)
ICON_DIR="/home/$USER/Pictures"
RANDOM_ICON=$(find "$ICON_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

# Copy the random image to a known location
cp "$RANDOM_ICON" "$ICON_DIR/random.png"

# Run fastfetch with the random image as logo
fastfetch --logo-type file --logo-path "$ICON_DIR/random.png" 