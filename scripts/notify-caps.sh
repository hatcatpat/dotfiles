#!/bin/bash

XSET=$(xset q | grep LED | tail -c +66)
CAPS="off"
if [[ $XSET == "1" ]]; then
	CAPS="on"
fi

NOTI_ID=$(dunstify "capslock" "" \
			 -r 4 \
			 -t 1000)

paplay ~/.local/share/scripts/sound.ogg --volume=32768

