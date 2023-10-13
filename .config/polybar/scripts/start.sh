#!/bin/sh

killall polybar xmobar
polybar -c ~/.config/polybar/config.ini topbar
#xmobar ~/.config/xmobar/xmobar-dracula.hs
