#!/usr/bin/env bash

# Remove the dock autohide delay (set to 0)
defaults write com.apple.dock autohide-delay -float 0

# Set autohide animation to 0 (no animation)
defaults write com.apple.dock autohide-time-modifier -float 0

# Make hidden apps in dock appear translucent
defaults write com.apple.dock showhidden -bool YES

# Automatically hide the Dock (no need to click the dock to hide)
defaults write com.apple.dock autohide -bool true

# Restart the Dock to apply changes
killall Dock

