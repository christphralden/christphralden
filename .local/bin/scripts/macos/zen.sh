#!/usr/bin/env bash

# This enables rawdogging development. No AI, No LSP, No mouse, No way to tell time
# Purely fueled by coffee and spotify
# 
# or Zen mode basically

zen_state_file="/tmp/zen_mode_enabled"
default_wallpaper="$HOME/Pictures/IU Wallpaper 1.jpg"
zen_wallpaper="$HOME/Pictures/black.png"

if [ -f "$zen_state_file" ]; then

    osascript -e 'tell application "System Events" to set picture of every desktop to "'"$default_wallpaper"'"'
    osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to false'
    rm "$zen_state_file"

    osascript -e 'display notification "Exited Zen mode." with title "Zen Mode"'
else
    osascript -e 'tell application "System Events" to set picture of every desktop to "'"$zen_wallpaper"'"'
    osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to true'
    touch "$zen_state_file"

    osascript -e 'display notification "Zen mode enabled." with title "Zen Mode"'
fi
