#!/usr/bin/env bash
set -eo pipefail

usage() {
    cat << EOF
usage: $0

OPTIONS:
   -d  Set debug mode
   -h  Show this message
EOF
}

while getopts "hd" OPTION
do
  case $OPTION in
    d)
      set -x
      ;;
    h)
      usage
      exit 0
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done

# TODO list
# - Turn off all prediction and autocorrect when typing (Accessibility -> zoom -> use scroll gesture with keyboard shortcut)
# - Enable zoom with keyboard shortcut (keyboard -> Text input -> input sources -> edit)
# - Trackpad tap to click (trackpad -> point & click -> tap to click)
# - Trackpad secondary click with two fingers (trackpad -> point & click -> secondary click)

# Turn off natural scrolling
defaults write -g com.apple.swipescrolldirection -bool false

# Speed up key repeats
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2
# Disable popup menu when holding down key
defaults write -g "ApplePressAndHoldEnabled" -bool "false"

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Disable the "Are you sure you want to open this application?" dialog. Yes I am sure.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Finder in column mode by default
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
# Don't warn when changing file suffix
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Make the dock smaller and hide it
defaults write com.apple.dock "tilesize" -int "36"
defaults write com.apple.dock "autohide" -bool "true"

# Set the screenshots dir to a folder on the desktop
if [ ! -d "$HOME/Desktop/screenshots" ]; then
    mkdir "$HOME"/Desktop/screenshots
fi
defaults write com.apple.screencapture "location" -string "~/Desktop/screenshots"
# Don't show the thumbnail after taking it
defaults write com.apple.screencapture "show-thumbnail" -bool "false"

# Set the regional time / data settings
# TODO: this doesn't work
# defaults write -g AppleFirstWeekday "{ gregorian = 2; }"

# Kill affected applications
APPS=(
    SystemUIServer
    Finder
    Dock
    Calendar
)

for APP in "${APPS[@]}"; do
    killall "$APP" &>/dev/null || true
done
