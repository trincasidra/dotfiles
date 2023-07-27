themedir="$HOME/.config/rofi/themes"
theme='launcher'

rofi_launcher() {
	rofi -show drun \
		-theme ${themedir}/${theme}.rasi \
        -icon-theme Dracula
}

rofi_launcher
