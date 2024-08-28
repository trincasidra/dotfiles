#!/bin/sh

gpuIcon=""
celsiusIcon="󰔄"
temp=$(nvidia-settings -q gpucoretemp -t)
echo "$gpuIcon  $temp$celsiusIcon"
exit 0
