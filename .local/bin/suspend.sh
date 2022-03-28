xidlehook --detect-sleep --not-when-fullscreen --not-when-audio --timer 60 'xset dpms force off' '' --timer 90 '$HOME/.local/bin/lock' '' --timer 300 'systemctl suspend' '' &
