#!/bin/bash

if [ "$1" == "inc" ]; then
   xbacklight -inc 10 -time 0
fi

if [ "$1" == "dec" ]; then
   xbacklight -dec 10 -time 0
fi

BRIGHTNESS=$(xbacklight -get | awk '{printf("%d\n",$1 + 0.5)}'  )

NOTI_ID=$(dunstify "brightness" "$BRIGHTNESS percent" \
			 -r 2 \
			 -t 1000)


paplay ~/.local/share/scripts/sound.ogg --volume=32768
