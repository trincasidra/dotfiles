shutdown='󰐥  Shutdown'
reboot='  Reboot'
lock='  Lock'
logout='󰍃  Logout'
yes='  Yes'
no='  No'

wofi_cmd() {
	wofi --conf ~/.config/wofi/powermenu.conf --style ~/.config/wofi/powermenu.css
}

# Confirmation CMD
confirm_cmd() {
	wofi --conf ~/.config/wofi/confirm.conf --style ~/.config/wofi/powermenu.css
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to wofi dmenu
run_wofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | wofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
            else
                pkill -u $USER
			fi
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_wofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l blur -- --time-str '%H:%M'
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
