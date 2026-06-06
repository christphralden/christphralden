#!/usr/bin/env bash

LANG_FILE="$HOME/.local/bin/scripts/tmux/.tmux-cht-lang"

selected=$(fzf --prompt="Language: " < "$LANG_FILE") || exit 0
read -rp "Search: " query
[[ -z "$query" ]] && exit 0

curl cht.sh/"$selected"/$(echo "$query" | tr ' ' '+')
