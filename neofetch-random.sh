#!/bin/bash

USER=$(whoami)
ICON_DIR="/home/$USER/Pictures"
RANDOM_ICON=$(find "$ICON_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

cp "$RANDOM_ICON" "$ICON_DIR/random.png"

# Run neofetch with the random image as logo
neofetch --image_source "$ICON_DIR/random.png" 