#!/usr/bin/env zsh

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
        ghostty)
        cd ~/.config/ghostty/ && nvim
        ;;
        *)
            echo "Unknown configuration command: $1"
            ;;
    esac
}

# utilities
alias ls='lsd -hA --group-dirs first'
alias tree='tree -a -L 4 -h -f'
alias ip='ipconfig getifaddr en0'
alias service="netstat -atp tcp"
alias cls="clear"
alias vim="nvim"

# tmux
alias detach='tmux detach'
alias tnew='tmux new -s'
alias attach='tmux attach -t'
alias tatt='tmux attach'

# custom
alias lsal='bat $HOME/.local/bin/scripts/alias/.listalias'
alias copy_dotfiles='$HOME/.local/bin/scripts/dotfiles/copy.sh'
alias gitnuke="git clean -df && git reset HEAD --hard"
alias gbda="git branch --merged | grep -v '\*' | xargs git branch -d"
alias unzipper='$HOME/.local/bin/scripts/utils/unzipper.sh'

# macos
alias menubar='$HOME/.local/bin/scripts/macos/menubar.scpt'
alias dock='$HOME/.local/bin/scripts/macos/dock.sh'
alias wallpaper='$HOME/.local/bin/scripts/macos/wallpaper.sh'
alias zen='$HOME/.local/bin/scripts/macos/zen.sh'


# js
alias nd="npm run dev"


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

fgco() {
  local branch
  branch=$(git branch --format="%(refname:short)" | fzf --preview="git log --oneline --color=always {} | head -20") || return
  git checkout "$branch"
}
