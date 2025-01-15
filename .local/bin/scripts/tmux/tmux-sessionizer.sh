#!/usr/bin/env bash

harpoon=(
    "$HOME/Developer/Desia/desia-application"
)

found_dirs=$(find ~/Developer -mindepth 1 -maxdepth 3 -type d \( -name '.git' -o -name 'node_modules' \) -prune -o -print)

all_dirs=$(printf "%s\n%s" "${harpoon[@]}" "$found_dirs" | awk '!x[$0]++')

selected=$(echo "$all_dirs" | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/Developer/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
