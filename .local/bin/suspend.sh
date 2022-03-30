xidlehook --detect-sleep --not-when-fullscreen --not-when-audio --timer 300 'xset dpms force off' '' --timer 360 '$HOME/.local/bin/lock' '' --timer 1500 'systemctl suspend' '' &
