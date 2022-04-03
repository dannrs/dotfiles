#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {
  pamixer --get-volume-human | cut -d '%' -f 1
}

function is_mute {
  pamixer --get-volume-human | grep 'muted' > /dev/null
}

function send_notification {
  if is_mute ; then
    dunstify -i "/usr/share/icons/Papirus-Dark/16x16/actions/audio-volume-muted.svg" -r 2593 -u normal "mute"
  else
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="—" 0 "$((volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i "/usr/share/icons/Papirus-Dark/16x16/actions/audio-volume-high.svg" -r 2593 -u normal "$bar"
  fi
}

case $1 in
  up)
    # up the volume (+ 5%)
    pamixer --increase 5 > /dev/null
    send_notification
    ;;
  down)
    pamixer --decrease 5 > /dev/null
    send_notification
    ;;
  mute)
    # toggle mute
    pamixer --toogle-mute > /dev/null
    send_notification
    ;;
esac
