# shellcheck shell=bash
# tmux-powerline user config. Only overrides; defaults live in the plugin.

# Flavor is chosen by tmux-dark-notify, inverted vs the OS: light OS -> dark bar
# (mocha), dark OS -> light bar (latte). The dark-notify snippets in ~/.tmux/
# write the current choice here; fall back to mocha.
_flavor_file="${XDG_STATE_HOME:-$HOME/.local/state}/tmux/tmux-powerline-flavor"
if [ -r "$_flavor_file" ]; then
  TMUX_POWERLINE_THEME_DEFAULT="$(cat "$_flavor_file")"
else
  TMUX_POWERLINE_THEME_DEFAULT="catppuccin-mocha"
fi

# Look for themes/segments here (this dir) before the plugin's built-ins.
export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

TMUX_POWERLINE_STATUS_JUSTIFICATION="left"
TMUX_POWERLINE_STATUS_INTERVAL="5"

# Session block shows just the session name (like the old #S block).
export TMUX_POWERLINE_SEG_TMUX_SESSION_INFO_FORMAT="#S"
