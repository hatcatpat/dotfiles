#!/bin/bash

if [ "$1" == "on" ]; then
	xinput --enable Synaptics\ tm2964-001
elif [ "$1" == "off" ]; then
	xinput --disable Synaptics\ tm2964-001
fi
