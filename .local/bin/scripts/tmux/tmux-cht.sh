#!/usr/bin/env bash
selected=`cat ~/.local/bin/scripts/tmux/.tmux-cht-lang ~/.local/bin/scripts/tmux/.tmux-cht-cmd | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Search: " query #shit i want to search for e.g slice

if grep -qs "$selected" ~/.local/bin/scripts/tmux/.tmux-cht-lang; then
    query=`echo $query | tr ' ' '+'`
    echo "${query}"
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
