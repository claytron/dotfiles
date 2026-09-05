# Sourced by tmux-dark-notify when macOS is in LIGHT mode.
# The status bar is intentionally the opposite of the OS: light OS -> dark bar (mocha).
run-shell 'd="${XDG_STATE_HOME:-$HOME/.local/state}/tmux"; mkdir -p "$d"; printf catppuccin-mocha > "$d/tmux-powerline-flavor"'
# Base bar background (fills the empty area between segments). Powerline only
# sets this at load, so re-set it here on every flavor switch.
set -g status-style "fg=#cdd6f4,bg=#1e1e2e"
set -g message-style "fg=#cdd6f4,bg=#313244"
set -g pane-active-border-style "fg=#fab387,bold"
set -g pane-border-style "fg=#313244"
run-shell 'tmux refresh-client -S'
