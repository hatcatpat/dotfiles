#!/bin/sh

get_battery() {
	echo "$(cat /sys/class/power_supply/BAT1/capacity)%"
}

get_time() {
	date +%H:%M
}

get_date() {
	date +%a-%d-%m | tr '[:upper:]' '[:lower:]'
}

get_audio() {
	amixer get Master | awk -F'[][]' 'END { print $2" "$6 }'
}

fifo='/tmp/status.fifo'

if [ -e $fifo ]; then
	# cmdline parser
	if [ $# -gt 0 ]; then
		case $1 in
		audio) echo 'audio' >$fifo ;;
		esac
		exit
	fi

	rm $fifo
fi

mkfifo $fifo

while true; do
	echo 'slow' >$fifo
	sleep 30
done &

audio="$(get_audio)"
dat="$(get_date)"
tim="$(get_time)"
battery="$(get_battery)"
while true; do
	while read -r cmd; do
		case $cmd in
		audio) audio=$(get_audio) ;;
		slow)
			dat=$(get_date)
			tim=$(get_time)
			battery=$(get_battery)
			;;
		esac
		xsetroot -name " :: a $audio :: b $battery :: $dat :: $tim :: "
	done <$fifo
done
