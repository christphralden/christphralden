#!/usr/bin/env zsh

bindkey -s '^xgc' 'git commit -m ""\C-b'
bindkey -s '^xgp' 'git push origin '

cls-x-buffer(){
  zle clear-screen
}

function clear-screen-and-scrollback() {
  echoti civis >"$TTY"
  printf '%b' '\e[H\e[2J\e[3J' >"$TTY"
  echoti cnorm >"$TTY"
  zle redisplay
}
zle -N clear-screen-and-scrollback
bindkey '^xl' clear-screen-and-scrollback


autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
