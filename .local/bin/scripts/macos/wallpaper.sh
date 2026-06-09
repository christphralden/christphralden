#!/usr/bin/env bash

search_dirs=(
    "$HOME/Pictures"
    "$HOME/Documents"
    "$HOME/Downloads"
    "$HOME/Desktop"
)

selected_file=$(find "${search_dirs[@]}" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) 2>/dev/null \
    | fzf --prompt="Select an image: ")

if [ -z "$selected_file" ]; then
    osascript -e 'display notification "No wallpaper chosen..." with title "Warning"'
    exit 1
fi

osascript -e 'tell application "System Events" to set picture of every desktop to "'"$selected_file"'"'

osascript -e 'display notification "Wallpaper changed!" with title "Desktop"'
