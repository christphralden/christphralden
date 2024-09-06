#!/usr/bin/env zsh

docker() {
    case "$1" in
        clean)
            shift
            docker rm $(docker ps --filter=status=exited --filter=status=created -q)
            ;;
        rmi-clean)
            shift
            docker rmi $(docker images -a --filter=dangling=true -q)
            ;;
        builder-prune)
            shift
            docker builder prune
            ;;
        *)
            command docker "$@"
            ;;
    esac
}

conf() {
    case "$1" in
        zshrc)
            cd ~ && nvim .zshrc
            ;;
        warp)
            cd ~/.warp/ && nvim
            ;;
        aerospace)
            cd ~/.config/aerospace/ && nvim
            ;;
        nvim)
            cd ~/.config/nvim/ && nvim
            ;;
        tmux)
            cd ~/.config/tmux/ && nvim
            ;;
        scripts)
            cd ~/.local/bin/scripts/ && nvim
            ;;
        wez)
            cd ~/.config/wezterm/ && nvim
            ;;
        *)
            echo "Unknown configuration command: $1"
            ;;
    esac
}

alias ls='lsd -hA --group-dirs first'
alias tree='tree -a -L 4 -h -f'
alias ip='ipconfig getifaddr en0'
alias detach='tmux detach'
alias tnew='tmux new -s'
alias attach='tmux attach -t'
alias tatt='tmux attach'
alias lsal='bat $HOME/.local/bin/scripts/alias/.listalias'
alias copy_dotfiles='$HOME/.local/bin/scripts/dotfiles/copy.sh'
alias y='yazi'
alias gitnuke="git clean -df && git reset HEAD --hard"

sd() {
  local dir
  dir=$(fzf --select-1 --exit-0 --preview 'tree -C {} | head -200')
  if [[ $? -eq 0 && -n "$dir" ]]; then
    if [[ -d "$dir" ]]; then
      cd "$dir"
    else
      cd "$(dirname "$dir")"
    fi
  fi
}

fop() {
  local file
  file=$(fzf --select-1 --exit-0 --preview 'cat {} | head -200')
  if [[ $? -ne 0 ]]; then
    return
  fi
  if [[ -n "$file" ]]; then
    local dir
    dir=$(dirname "$file")
    open -a Finder "$dir"
  fi
}

yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
