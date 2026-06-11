#!/usr/bin/env bash
# Claude Code statusline.
# Reads the session JSON on stdin, writes the integer context % to
# /tmp/claude-ctx-pct (consumed by the remember plugin's user-prompt-hook
# for its 95% /remember nudge), and prints a single status line.

set -u

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // empty')
dir=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // empty')
pct_raw=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')

pct=""
if [ -n "$pct_raw" ]; then
    pct=${pct_raw%.*}
    printf '%s' "$pct" > "${TMPDIR:-/tmp}/claude-ctx-pct" 2>/dev/null || true
fi

basename_dir=${dir##*/}
segments=()
[ -n "$model" ] && segments+=("$model")
[ -n "$basename_dir" ] && segments+=("$basename_dir")
[ -n "$pct" ] && segments+=("${pct}% ctx")

IFS=' · '
echo "${segments[*]}"
