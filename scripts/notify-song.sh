#!/bin/bash
PLAYING=$(playerctl status)

if [[ $PLAYING == "Paused" ]]; then
	ALBUM=$(playerctl metadata album)
	SONG=$(playerctl metadata title)

	NOTI_ID=$(dunstify "$ALBUM" "$SONG" \
				 -r 5 \
				 -t 1000)
fi

paplay ~/.local/share/scripts/sound.ogg --volume=32768
