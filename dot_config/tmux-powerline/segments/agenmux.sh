# shellcheck shell=bash
# Custom segment: agenmux agent status summary.
# agenmux exposes its compact summary via `agenmux status`.

run_segment() {
  local bin out reset
  bin="$(command -v agenmux 2>/dev/null)"
  [ -n "$bin" ] || bin="$(ls -t "$HOME"/.tmux/plugins/agenmux*/target/release/agenmux 2>/dev/null | head -n1)"
  [ -x "$bin" ] || return 0
  out="$("$bin" status 2>/dev/null)" || return 0
  [ -n "$out" ] || return 0
  # agenmux emits #[default] between glyphs, which resets this segment's
  # background. Re-assert the segment colors instead so the block stays solid.
  reset="#[fg=${TMUX_POWERLINE_CUR_SEGMENT_FG},bg=${TMUX_POWERLINE_CUR_SEGMENT_BG}]"
  # Brackets must be escaped: an unescaped [default] is a glob character class.
  echo "${out//#\[default\]/$reset}"
  return 0
}
