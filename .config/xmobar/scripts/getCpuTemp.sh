#!/bin/sh

cpuIcon=""
celsiusIcon="󰔄"
sensorsOutput=$(sensors)
# awk doesn't seem to like the º character
temp=$(awk -F"[+.]" '/Tctl:/ { print $2 }' <<< ${sensorsOutput})
echo "$cpuIcon  $temp$celsiusIcon"
exit 0
