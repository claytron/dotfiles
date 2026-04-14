#!/usr/bin/env bash

# Remove the bootstrap chezmoi binary if Homebrew's version is available.
# The bootstrap binary in ~/bin can shadow the Homebrew version due to PATH order.
if command -v brew &>/dev/null && brew list chezmoi &>/dev/null && [ -f "$HOME/bin/chezmoi" ]; then
    echo "Removing chezmoi from initial bootstrapping"
    rm -v "$HOME/bin/chezmoi"
fi
