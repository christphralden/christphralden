#!/usr/bin/env zsh

ALIASES_YAML="$HOME/.local/bin/scripts/alias/aliases.yaml"
ALIASES_DIR="$HOME/.local/bin/scripts/alias"

eval "$(ruby "$ALIASES_DIR/load_aliases.rb" "$ALIASES_YAML")"

conf() {
  case "$1" in
    zshrc)     cd ~ && nvim .zshrc ;;
    warp)      cd ~/.warp/ && nvim ;;
    aerospace) cd ~/.config/aerospace/ && nvim ;;
    nvim)      cd ~/.config/nvim/ && nvim ;;
    tmux)      cd ~/.config/tmux/ && nvim ;;
    scripts)   cd ~/.local/bin/scripts/ && nvim ;;
    wez)       cd ~/.config/wezterm/ && nvim ;;
    ghostty)   cd ~/.config/ghostty/ && nvim ;;
    *)         echo "Unknown configuration: $1" ;;
  esac
}

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

unalias ga 2>/dev/null
ga() {
  git add "$@" && git status
}

fgco() {
  local branch
  branch=$(git branch --format="%(refname:short)" | fzf --preview="git log --oneline --color=always {} | head -20") || return
  git checkout "$branch"
}

alias-d() {
  local sep
  sep=$(printf '\037')
  local selected
  selected=$(
    ruby "$ALIASES_DIR/list_aliases.rb" "$ALIASES_YAML" \
    | awk -F'\t' -v sep="$(printf '\037')" '{
        printf "%-10s  %-14s  %-55s  %s%s%s\n", $1, $2, $3, $4, sep, $3
      }' \
    | fzf --ansi --delimiter="$(printf '\037')" --with-nth=1 \
          --header="category    name            command                                                      description"
  ) || return
  printf '%s\n' "${selected#*$(printf '\037')}"
}
