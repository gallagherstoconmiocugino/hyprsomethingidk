#!/bin/bash

# Prompt for confirmation
read -p "[SOSPENDI] sicuro? (s/n): " confirm

# Check the response
if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
    # Exit Hyprland
    echo Simone | sudo -S systemctl suspend
else
    # Do nothing and exit script
    echo "annullato"
fi
