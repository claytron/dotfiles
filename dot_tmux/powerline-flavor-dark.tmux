# Sourced by tmux-dark-notify when macOS is in DARK mode.
# The status bar contrasts with the OS but stays easy on the eyes: dark OS ->
# muted macchiato bar (softer than the bright latte).
run-shell 'd="${XDG_STATE_HOME:-$HOME/.local/state}/tmux"; mkdir -p "$d"; printf catppuccin-macchiato > "$d/tmux-powerline-flavor"'

# Base bar background (fills the empty area between segments). Powerline only
# sets this at load, so re-set it here on every flavor switch.
set -g status-style "fg=#cad3f5,bg=#24273a"
set -g message-style "fg=#cad3f5,bg=#363a4f"
set -g pane-active-border-style "fg=#f5a97f,bold"
set -g pane-border-style "fg=#363a4f"

# agenmux matches the OS (unlike the bar): dark OS -> dark sidebar. Applies on
# the sidebar's next open; reload also refreshes its key hints.
run-shell 'cfg="${XDG_CONFIG_HOME:-$HOME/.config}/agenmux/config.toml"; [ -f "$cfg" ] && sed -i "" "s/^base = .*/base = \"dark\"/" "$cfg"; bin="$(command -v agenmux || ls -t "$HOME"/.tmux/plugins/agenmux*/target/release/agenmux 2>/dev/null | head -n1)"; [ -x "$bin" ] && "$bin" config reload >/dev/null 2>&1; true'

# Update running tmux
run-shell 'tmux refresh-client -S'
