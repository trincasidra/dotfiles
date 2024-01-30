Config {
    font = "xft:JetBrainsMono NF:weight=bold:pixelsize=14:antialias=true:hinting=true",
    bgColor = "#282a36",
    fgColor = "#f8f8f2",
    alpha = 0,
    position = TopSize C 100 30,
    lowerOnStart = True,
    hideOnStart  = False,
    allDesktops  = True,
    persistent   = True,
    iconRoot     = ".",
    commands = [
        Run Com "echo" ["\xf03d5"] "updateicon" 3600,
        Run Com "echo" ["\xf057e"] "volumeicon" 3600,
        Run Com "echo" ["<fc=#bd93f9>|</fc>"] "sep" 10000,
        Run Date "\xf073  %a %_d/%m/%y" "date"  100000,
        Run Date "%H:%M" "time" 10,
        Run BatteryP [ "BAT0" ] [
            "--template", "<acstatus>",
            "--Low", "10",
            "--High", "80",
            "--low", "#ff5555",
            "--normal", "#f1fa8c",
            "--high", "#50fa7b",
            "--", -- battery specific options
            -- discharging status
            "-o", "\xf241 <left>% (<timeleft>)",
            -- AC "on" status
            "-O", "\xf241 <left>% <fc=#98be65>\xf062</fc>", -- 50fa7b
            -- charged status
            "-i", "\xf240 <fc=#50fa7b>Full</fc>"
        ] 50,
        Run Com "bash" ["-c", ". ~/.config/xmobar/scripts/checkUpdates.sh"] "check-updates" 1800,
        Run DynNetwork ["-t", "\xf063 <rx>kb \xf062 <tx>kb"] 20,
        Run Cpu [
            "--template", "\xf2db <total>%",
            "--Low", "3",
            "--High", "50",
            "--low", "#282a36",
            "--normal", "#ffb86c",
            "--high", "#ff5555"
        ] 50,
        Run Com "bash" ["-c", ". ~/.config/xmobar/scripts/getVolume.sh"] "myVolume" 10,
        Run XMonadLog
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " %XMonadLog% } %time% { <fc=#282a36><action=`kitty btop`>%cpu%</action> %sep% %dynnetwork% %sep% <action=`kitty doas pacman -Syu --noconfirm && kitty xmonad --recompile`>%updateicon% %check-updates%</action> %sep% <action=`amixer -q -D pulse sset Master toggle` button=1>%volumeicon% %myVolume%</action> %sep% <action=`kitty calcurse`>%date%</action></fc> "
}
