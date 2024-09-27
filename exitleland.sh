#!/bin/bash

# Prompt for confirmation
read -p "sicuro? (s/n): " confirm

# Check the response
if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
    # Exit Hyprland
    hyprctl dispatch exit
else
    # Do nothing and exit script
    echo "annullato"
fi
