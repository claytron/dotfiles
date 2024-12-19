#!/usr/bin/env bash

# Get terminal settings correct for italics
tic tmux.terminfo
tic tmux-256color.terminfo

# File for per machine settings
# TODO: use chezmoi for this part properly
touch ~/.tmux.local

# Set up TPM for plugins
if [ ! -d "$HOME/.tmux/plugins" ]; then
    echo "Install TMUX Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
