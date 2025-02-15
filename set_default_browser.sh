#!/bin/sh
xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop
xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/http
xdg-mime default org.qutebrowser.qutebrowser.desktop scheme-handler/http
xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/https
xdg-mime default org.qutebrowser.qutebrowser.desktop scheme-handler/https
