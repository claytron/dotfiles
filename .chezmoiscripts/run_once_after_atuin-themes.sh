#!/usr/bin/env bash

echo "set up atuin themes"

theme_dir="$HOME/.config/atuin/themes"
[ -d "$theme_dir" ] || mkdir -p "$theme_dir"

wget --quiet -P "$theme_dir" https://raw.githubusercontent.com/catppuccin/atuin/refs/heads/main/themes/latte/catppuccin-latte-mauve.toml
wget --quiet -P "$theme_dir" https://raw.githubusercontent.com/catppuccin/atuin/refs/heads/main/themes/mocha/catppuccin-mocha-mauve.toml
