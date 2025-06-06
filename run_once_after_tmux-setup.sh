#!/usr/bin/env bash

echo "set up tmux terminfo"

# Get terminal settings correct for italics
tic ~/.local/share/chezmoi/tmux.terminfo
tic ~/.local/share/chezmoi/tmux-256color.terminfo
