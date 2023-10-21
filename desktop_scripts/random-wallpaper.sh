#!/bin/sh

IFS="
"
wallpaper_directory=$1
duration=$2

while true; do
	ls $wallpaper_directory |sort -R |tail -$N |while read file; do
   	current_swaybg_pid=$(pgrep -x swaybg)
   	wallpaper="$wallpaper_directory/$file"
   	sh -c "swaybg -o \"*\" -i $wallpaper -m fill -c \"#000000\" > /dev/null 2>&1 &" \
       	&& sleep 1 \
       	&& kill $current_swaybg_pid
   	sleep $duration
	done
done
