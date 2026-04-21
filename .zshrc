export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && \
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ] && \
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] \
  && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/christopheralden/fvm/versions/stable/bin:$PATH"
export PATH="/Users/alden-desia/.local/bin:$PATH"

source "$HOME/.local/bin/scripts/alias/setup-alias.sh"
source "$HOME/.local/bin/scripts/alias/desia.private.sh"

eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

export UV_HTTP_TIMEOUT=300

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi


