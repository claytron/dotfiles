#!/usr/bin/env bash
# Wrapper for the remember plugin's UserPromptSubmit hook.
# The plugin's own hooks.json only registers SessionStart + PostToolUse, so
# we wire UserPromptSubmit here. The wrapper resolves the latest installed
# plugin version dynamically so it survives upgrades.

set -u

PLUGIN_BASE="$HOME/.claude/plugins/cache/dpt-plugins/remember"
[ -d "$PLUGIN_BASE" ] || exit 0

version_dir=$(find "$PLUGIN_BASE" -mindepth 1 -maxdepth 1 -type d -print 2>/dev/null \
    | sort -V \
    | tail -n 1)
[ -n "$version_dir" ] || exit 0

hook="$version_dir/scripts/user-prompt-hook.sh"
[ -x "$hook" ] || [ -r "$hook" ] || exit 0

export CLAUDE_PLUGIN_ROOT="$version_dir"
exec bash "$hook"
