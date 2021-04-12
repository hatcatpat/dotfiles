#!/bin/bash
XPROP=$(xprop -root -notype _NET_CURRENT_DESKTOP | tr -d "_NET_CURRENT_DESKTOP = ")
DESKTOP="$((XPROP+1))"
NOTI_ID=$(dunstify "desktop $DESKTOP" "" \
			 -r 3 \
			 -t 1000)

#paplay ~/.local/share/scripts/sound.ogg --volume=32768
