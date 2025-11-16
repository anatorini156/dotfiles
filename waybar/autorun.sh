#!/usr/bin/env zsh

CONFIG_FILES="$HOME/.config/waybar/config.jsonc"

trap "killall waybar" EXIT

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    pkill -9 waybar
done
