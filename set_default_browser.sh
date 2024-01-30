#!/bin/sh
xdg-settings set default-web-browser nbrowser.desktop
xdg-mime default nbrowser.desktop x-scheme-handler/http
xdg-mime default nbrowser.desktop scheme-handler/http
xdg-mime default nbrowser.desktop x-scheme-handler/https
xdg-mime default nbrowser.desktop scheme-handler/https
