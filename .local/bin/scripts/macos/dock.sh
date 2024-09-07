#!/usr/bin/env bash

# Remove the dock autohide delay
defaults write com.apple.dock autohide-delay -float 0
# Make hidden apps in dock appear translucent
defaults write com.apple.Dock showhidden -bool YES
killall Dock
