# shellcheck shell=bash
# Shared Catppuccin layout for tmux-powerline.
# The flavor files (catppuccin-mocha.sh / catppuccin-latte.sh) set the thm_*
# palette, then source this. Keep layout here so both flavors stay in sync.

# Powerline separators (nerd font glyphs), as ANSI-C escapes so the raw
# private-use-area bytes never need to survive a file round-trip.
# Named by direction: LEFT_* point left (◀ ❮), RIGHT_* point right (▶ ❯).
TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=$'\ue0b2'
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=$'\ue0b3'
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=$'\ue0b0'
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=$'\ue0b1'

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR="$thm_base"
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR="$thm_text"
TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR="$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD"
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR="$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD"

# Window list. Every window is a flat block: inactive on the base bg, the
# current window a solid accent box (same hard edges on both sides, so it stays
# clean next to any neighbor -- base, the mauve session, or a @warn window).
#
# A window marked with the @warn flag (<prefix>+P; clear with <prefix>+O) turns
# red in both active and inactive states. The #{?@warn,...} test is evaluated
# by tmux per window at render time, so it tracks the specific flagged window.
_win_inactive="#[fg=${thm_overlay1}]#[bg=${thm_base}] #I#{?window_flags,#F, }#W "
_win_current="#[fg=${thm_crust}]#[bg=${thm_blue}]#[bold] #I#{?window_flags,#F, }#W #[nobold]"
_warn_inactive="#[fg=${thm_crust}]#[bg=${thm_red}] #I#{?window_flags,#F, }#W "
_warn_current="#[fg=${thm_crust}]#[bg=${thm_red}]#[bold] #I#{?window_flags,#F, }#W #[nobold]"

TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
  "#{?@warn,${_warn_inactive},${_win_inactive}}"
)
TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
  "#{?@warn,${_warn_current},${_win_current}}"
)

# Left: session block (the window list is rendered after it by tmux).
TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
  "tmux_session_info ${thm_mauve} ${thm_crust}"
)

# Right, in display order: date < time < agenmux < host < mode.
TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
  "date ${thm_surface0} ${thm_subtext1}"
  "time ${thm_surface1} ${thm_text}"
  "agenmux ${thm_surface0} ${thm_text}"
  "hostname ${thm_blue} ${thm_crust}"
  # mode_indicator paints its own per-mode bg, so drop powerline's separator and
  # padding and let the segment be a flat box (fields: sep, sep_bg, sep_fg, spacing, separator).
  "mode_indicator ${thm_mauve} ${thm_crust} default_separator no_sep_bg_color no_sep_fg_color both_disable separator_disable"
)
