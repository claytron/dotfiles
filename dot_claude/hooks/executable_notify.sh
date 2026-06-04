#!/usr/bin/env bash
# Claude Code notification hook — wired to Notification and Stop events.
# Skips the Stop notification when a terminal app is frontmost so you don't
# get pinged while actively watching the session.

set -u

input=$(cat)
event=$(printf '%s' "$input" | jq -r '.hook_event_name // empty')
message=$(printf '%s' "$input" | jq -r '.message // empty')
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty')
transcript_path=$(printf '%s' "$input" | jq -r '.transcript_path // empty')

last_assistant_text() {
    local path=$1
    [ -f "$path" ] || return 1
    jq -rs 'map(select(.message.role == "assistant" and (.message.content | type == "array"))) | last | .message.content | map(select(.type == "text") | .text) | join(" ")' "$path" 2>/dev/null \
        | tr '\n' ' ' \
        | sed -E 's/[[:space:]]+/ /g; s/^ //; s/ $//' \
        | cut -c 1-180
}

session_title() {
    local path=$1
    [ -f "$path" ] || return 1
    jq -rs 'map(select(.type == "ai-title")) | last | .aiTitle // empty' "$path" 2>/dev/null
}

project=""
if [ -n "$cwd" ]; then
    project=$(basename "$cwd")
fi

frontmost=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>/dev/null || true)
terminal_apps='^(Terminal|iTerm2|Ghostty|Alacritty|WezTerm|kitty|Hyper|Tabby|Warp)$'

case "$event" in
    Notification)
        title="Claude needs you"
        body="${message:-Awaiting input}"
        sound="Glass"
        ;;
    Stop)
        if printf '%s' "$frontmost" | grep -Eq "$terminal_apps"; then
            exit 0
        fi
        title="Claude done"
        body=$(last_assistant_text "$transcript_path")
        [ -z "$body" ] && body="Task complete"
        sound="Pop"
        ;;
    *)
        exit 0
        ;;
esac

title_str=$(session_title "$transcript_path")
if [ -n "$project" ] && [ -n "$title_str" ]; then
    subtitle="${project} · ${title_str}"
elif [ -n "$title_str" ]; then
    subtitle="$title_str"
else
    subtitle="${project:-Claude Code}"
fi

if command -v terminal-notifier >/dev/null 2>&1; then
    terminal-notifier \
        -title "$title" \
        -subtitle "$subtitle" \
        -message "$body" \
        -sound "$sound" \
        -group "claude-code-${project:-default}" \
        -activate net.kovidgoyal.kitty \
        >/dev/null 2>&1 || true
else
    osascript \
        -e 'on run argv' \
        -e 'display notification (item 3 of argv) with title (item 1 of argv) subtitle (item 2 of argv) sound name (item 4 of argv)' \
        -e 'end run' \
        -- "$title" "$subtitle" "$body" "$sound" >/dev/null 2>&1 || true
fi

exit 0
