xautolock -time 5 -locker $HOME/.local/bin/lock -notify 20 -notifier 'xset dpms force off' &
xautolock -time 15 -locker "systemctl suspend" &
