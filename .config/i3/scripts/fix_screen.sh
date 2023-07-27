#!/bin/bash

screen="$(xrandr --query | grep HD | awk {'print $1'})"
hdmi="HDMI"

if [[ "$screen" == *"$hdmi"* ]]; then
  bash ~/.screenlayout/casa.sh
else
  echo "Only 1 screen."
fi
