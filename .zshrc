export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/christopheralden/fvm/versions/stable/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { _load_nvm; nvm "$@" }
node() { _load_nvm; node "$@" }
npm() { _load_nvm; npm "$@" }
npx() { _load_nvm; npx "$@" }

export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border"
eval "$(fzf --zsh)"

fuck() { eval "$(thefuck --alias)"; fuck "$@" }

eval "$(zoxide init zsh)"

export UV_HTTP_TIMEOUT=300

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
command -v starship &>/dev/null && eval "$(starship init zsh)"

source "$HOME/.local/bin/scripts/alias/setup-alias.sh"
source "$HOME/.local/bin/scripts/alias/desia.private.sh"
