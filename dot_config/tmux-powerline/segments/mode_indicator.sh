# shellcheck shell=bash
# Custom mode indicator: one fixed-width, single-color box per mode.
#
# Replaces powerline's built-in mode_indicator (and the old tmux-mode-indicator
# plugin). Modes are mutually exclusive (prefix > copy > sync > normal) and every
# label is the same width, so the segment never changes size between modes.
# Each mode gets its own background, like the old plugin's *_mode_style.
#
# The theme's thm_* palette vars are in scope here (powerline sources the theme,
# then the segments, in one shell), so the colors follow the active flavor.

run_segment() {
  local fg="${thm_crust:-#11111b}"
  local c_normal="${thm_mauve:-#cba6f7}"
  local c_prefix="${thm_green:-#a6e3a1}"
  local c_copy="${thm_peach:-#fab387}"
  local c_sync="${thm_red:-#f38ba8}"

  # Labels padded to a common width (8) so nothing bounces on mode change.
  local l_normal=" NORMAL " l_prefix=" PREFIX " l_copy="  COPY  " l_sync="  SYNC  "

  local normal="#[fg=${fg}]#[bg=${c_normal}]#[bold]${l_normal}"
  local prefix="#[fg=${fg}]#[bg=${c_prefix}]#[bold]${l_prefix}"
  local copy="#[fg=${fg}]#[bg=${c_copy}]#[bold]${l_copy}"
  local sync="#[fg=${fg}]#[bg=${c_sync}]#[bold]${l_sync}"

  # tmux evaluates these conditionals at render time (prefix > copy > sync > normal).
  printf '%s' "#{?client_prefix,${prefix},#{?pane_in_mode,${copy},#{?pane_synchronized,${sync},${normal}}}}"
}
