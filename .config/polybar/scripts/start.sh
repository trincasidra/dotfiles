#!/bin/sh

killall polybar

hdmi='HDMI'

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ "$m" == *"$hdmi"* ]]; then
      MONITOR=$m polybar -c ~/.config/polybar/config.ini topbar &
    else
      MONITOR=$m polybar -c ~/.config/polybar/config.ini topbar &
    fi
  done
else
    polybar -c ~/.config/polybar/config.ini topbar
fi
