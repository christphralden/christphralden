
# macOS Configuration

## Dock Configuration
```sh
# Remove the dock autohide delay
defaults write com.apple.dock autohide-delay -float 0
killall Dock
```

## Terminal Configurations

### Homebrew Installation
```sh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### iTerm2 Installation
```sh
brew install --cask iterm2
```

### Oh My Zsh Installation
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
*Note: Previous settings will be saved to `~/.zshrc.pre-oh-my-zsh`.*

### Theme: PowerLevel10k
```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
*Note: Set the theme in `~/.zshrc`*
```sh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Zsh Plugins Installation
#### zsh-autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### zsh-syntax-highlighting
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

*Note: Configure plugins in `~/.zshrc`*
```sh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
```

### Terminal Utilities

#### VSCode FindItFaster
```sh
https://github.com/tomrijndorp/vscode-finditfaster
```

#### fzf
```sh
#Install using Homebrew
brew install fzf

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#Optional: Update
brew update; brew upgrade fzf
```

#### rigrep
```sh
#Install using Homebrew
brew install ripgrep
```

#### bat
```sh
#Install using Homebrew
brew install bat
```

#### tree
```sh
#Install using Homebrew
brew install tree
```

### Custom Functions
*Note: All of these are in ~/.zshrc

#### fuzzy cd
```sh
fcd() {
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
```

#### fuzzy open finder
```sh
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
```
#### fuzzy open vscode
```sh
vsc() {
  local file
  file=$(fzf --select-1 --exit-0 --preview 'cat {} | head -200')
  if [[ $? -ne 0 ]]; then
    return
  fi
  if [[ -n "$file" ]]; then
    local dir
    dir=$(dirname "$file")
    code "$dir"
  fi
}

#Create an alias overriding code
alias code="vsc"
```




