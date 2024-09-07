#!/usr/bin/env bash

search_dir="$HOME/Pictures"

selected_file=$(find "$search_dir" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
    | sed "s|^$search_dir/||" \
    | fzf --prompt="Select an image: ")

if [ -z "$selected_file" ]; then
    osascript -e 'display notification "No wallpaper chosen..." with title "Warning"'
    exit 1
fi

full_path="$search_dir/$selected_file"

osascript -e 'tell application "System Events" to set picture of every desktop to "'"$full_path"'"'

osascript -e 'display notification "Wallpaper changed!" with title "Desktop"'
