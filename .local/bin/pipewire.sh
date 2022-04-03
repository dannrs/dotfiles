#!/bin/sh

DEFAULT_SOURCE=$(pw-record --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: source description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
DEFAULT_SINK=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: sink description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
VOLUME=$(pamixer --get-volume-human)

case $1 in
    "--up")
        pamixer --increase 5
        ;;
    "--down")
        pamixer --decrease 5
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
	volume=$(pamixer --get-volume human | cut -d '%' -f 1)
        if [ "$volume" = "0" ]; then
	    echo "  "
    else
        if [ "$volume" -lt "50" ]; then
	    echo "  "
    else
        if [ "$volume" -lt "80" ]; then
	    echo "  "
	fi
	fi
	fi
esac
