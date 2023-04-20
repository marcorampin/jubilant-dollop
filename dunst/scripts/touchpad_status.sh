#!/bin/bash

# See README.md for usage instructions

# Get touchpad status
function get_touchpad {
	swaymsg -t get_inputs | jq -r '.[] | select(.type == "touchpad").libinput.send_events'
}

# Returns a touchpad icon depending on the status
function get_touchpad_icon {
    touchpad=$(get_touchpad)
    if [ "$touchpad" == "disabled" ] ; then
        touchpad_icon="󰤳  "
    else
        touchpad_icon="󰟸  "
    fi
}

# Displays a volume notification using dunstify
function show_touchpad_notif {
    touchpad=$(get_touchpad)
    get_touchpad_icon
    dunstify "$touchpad_icon Touchpad $touchpad"
}


# Main function
#
case $1 in
    notif)
    # shows notification
    show_touchpad_notif
    ;;
esac
