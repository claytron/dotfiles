# Sourced by tmux-dark-notify when macOS is in LIGHT mode.
# The status bar is intentionally the opposite of the OS: light OS -> dark bar (mocha).
run-shell 'd="${XDG_STATE_HOME:-$HOME/.local/state}/tmux"; mkdir -p "$d"; printf catppuccin-mocha > "$d/tmux-powerline-flavor"'

# Base bar background (fills the empty area between segments). Powerline only
# sets this at load, so re-set it here on every flavor switch.
set -g status-style "fg=#cdd6f4,bg=#1e1e2e"
set -g message-style "fg=#cdd6f4,bg=#313244"
set -g pane-active-border-style "fg=#fab387,bold"
set -g pane-border-style "fg=#313244"

# agenmux matches the OS (unlike the bar): light OS -> light sidebar. Applies on
# the sidebar's next open; reload also refreshes its key hints.
run-shell 'cfg="${XDG_CONFIG_HOME:-$HOME/.config}/agenmux/config.toml"; [ -f "$cfg" ] && sed -i "" "s/^base = .*/base = \"light\"/" "$cfg"; bin="$(command -v agenmux || ls -t "$HOME"/.tmux/plugins/agenmux*/target/release/agenmux 2>/dev/null | head -n1)"; [ -x "$bin" ] && "$bin" config reload >/dev/null 2>&1; true'

# Update running tmux
run-shell 'tmux refresh-client -S'
