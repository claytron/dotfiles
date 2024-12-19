#!/usr/bin/env bash

echo "set up bat themes"

if which bat >/dev/null; then
    [ -d "$(bat --config-dir)" ] || mkdir -p "$(bat --config-dir)"

    theme_dir="$(bat --config-dir)"/themes
    [ ! -d "$theme_dir" ] || mkdir -p "$theme_dir"

    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

    bat cache --build
fi

