#!/bin/bash

if [ "$1" == "inc" ]; then
   amixer -q sset Master 5%+
fi

if [ "$1" == "dec" ]; then
   amixer -q sset Master 5%-
fi

if [ "$1" == "mute" ]; then
   amixer -q sset Master toggle
fi

AMIXER=$(amixer sget Master)
VOLUME=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | tr -d "%")
MUTE=$(echo $AMIXER | grep -o '\[off\]' | tail -n 1)

if [[ $MUTE != "" ]]; then
	NOTI_ID=$(dunstify "volume" "muted" \
				 -r 1 \
				 -t 1000)
else
	NOTI_ID=$(dunstify "volume" "$VOLUME percent" \
				 -r 1 \
				 -t 1000)
fi

paplay ~/.local/share/scripts/sound.ogg --volume=32768
