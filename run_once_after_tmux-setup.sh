#!/usr/bin/env bash

echo "set up tmux"

# Get terminal settings correct for italics
tic $(chezmoi source-path)/tmux.terminfo
tic $(chezmoi source-path)/tmux-256color.terminfo

# File for per machine settings
# TODO: use chezmoi for this part properly
touch ~/.tmux.local

# Set up TPM for plugins
if [ ! -d "$HOME/.tmux/plugins" ]; then
    echo "Install TMUX Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
