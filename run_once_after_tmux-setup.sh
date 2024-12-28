#!/usr/bin/env bash

echo "set up tmux terminfo"

# Get terminal settings correct for italics
tic "$(chezmoi source-path)"/tmux.terminfo
tic "$(chezmoi source-path)"/tmux-256color.terminfo
