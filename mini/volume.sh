#!/bin/sh

cmd='amixer -q set Master'
step='4%'

case $1 in
up) $cmd "$step+" ;;
down) $cmd "$step-" ;;
toggle) $cmd 'toggle' ;;
esac

"$HOME/scripts/status.sh" 'audio'
