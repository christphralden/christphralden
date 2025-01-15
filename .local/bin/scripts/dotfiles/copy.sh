#!/usr/bin/env bash

run() {
  local repo_root="$HOME/Developer/christphralden/"
  local repo_local="$HOME/Developer/christphralden/.local/bin/"
  local repo_config="$HOME/Developer/christphralden/.config/"
  
  local files_to_copy_to_root=(
    "$HOME/.zshrc"
    "$HOME/.p10k.zsh"
    "$HOME/.ideavimrc"
    "$HOME/.warp"

  )

  local files_to_copy_to_config=(
    "$HOME/.config/wezterm"
    "$HOME/.config/nvim"
    "$HOME/.config/aerospace"
    "$HOME/.config/ghostty"
  )

  local files_to_copy_to_local=(
    "$HOME/.local/bin/scripts"
  )

  # Create dir if not available
  if [ ! -d "$repo_root" ]; then
    mkdir -p "$repo_root"
  fi

  if [ ! -d "$repo_local" ]; then
    mkdir -p "$repo_local"
  fi

  if [ ! -d "$repo_config" ]; then
    mkdir -p "$repo_config"
  fi

  if [ ! -d "${repo_config}tmux" ]; then
    mkdir -p "${repo_config}tmux"
  fi

  # Copy dotfiles
  for file in "${files_to_copy_to_root[@]}"; do
    if cp -R "$file" "$repo_root"; then
      echo "Successfully copied $(basename "$file") to $repo_root."
    else
      echo "Failed to copy $(basename "$file")."
    fi
  done

  for file in "${files_to_copy_to_local[@]}"; do
    if cp -R "$file" "$repo_local"; then
      echo "Successfully copied $(basename "$file") to $repo_local."
    else
      echo "Failed to copy $(basename "$file")."
    fi
  done

  for file in "${files_to_copy_to_config[@]}"; do
    if cp -R "$file" "$repo_config"; then
      echo "Successfully copied $(basename "$file") to $repo_config."
    else
      echo "Failed to copy $(basename "$file")."
    fi
  done

  if cp -R "$HOME/.config/tmux/tmux.conf" "${repo_config}tmux"; then
    echo "Successfully copied tmux.conf to $repo_config."
  fi

}

run
