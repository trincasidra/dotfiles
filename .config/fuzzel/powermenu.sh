#!/bin/bash
options="󰍃  Logout\n  Reboot\n󰐥  Shutdown"
choice=$(echo -e "$options" | fuzzel --inner-pad=0 --lines=4 --width=8 --prompt= --prompt-color=282a36ff --input-color=282a36ff --dmenu)
case "$choice" in
    "  Lock'")
        swaylock
        ;;
    "󰍃  Logout")
        hyprctl dispatch exit 1
        ;;
    "  Reboot")
        systemctl reboot
        ;;
    "󰐥  Shutdown")
        systemctl poweroff
        ;;
    *)
        echo "No valid option selected."
        ;;
esac

