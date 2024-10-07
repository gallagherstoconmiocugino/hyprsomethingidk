#!/bin/bash

# Prompt for confirmation
read -p "[RIAVVIA] sicuro? (s/n): " confirm

# Check the response
if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
    # Exit Hyprland
    echo Simone | sudo -S reboot now
else
    # Do nothing and exit script
    echo "annullato"
fi
