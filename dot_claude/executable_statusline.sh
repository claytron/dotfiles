#!/usr/bin/env bash
# Claude Code statusline.
# Reads the session JSON on stdin, writes the integer context % to
# $TMPDIR/claude-ctx-pct (consumed by the remember plugin's user-prompt-hook
# for its 95% /remember nudge), and prints a color-coded status line.
# Requires a Nerd Font for the glyphs.

set -u

input=$(cat)

# Single jq pass -> fields joined by unit-separator (0x1f). Tab can't be used
# as the read delimiter: it's IFS-whitespace, so empty fields would collapse
# and shift every later field left.
IFS=$'\x1f' read -r model dir pct_raw cost added removed used_tok max_tok \
    effort fast_mode thinking repo_owner repo_name <<EOF
$(printf '%s' "$input" | jq -r '[
  (.model.display_name // ""),
  (.workspace.current_dir // .cwd // ""),
  (.context_window.used_percentage // ""),
  (.cost.total_cost_usd // ""),
  (.cost.total_lines_added // ""),
  (.cost.total_lines_removed // ""),
  (.context_window.total_input_tokens // ""),
  (.context_window.context_window_size // ""),
  (.effort.level // ""),
  (.fast_mode // false),
  (.thinking.enabled // false),
  (.workspace.repo.owner // ""),
  (.workspace.repo.name // "")
] | map(tostring) | join("\u001f")')
EOF

# Integer context %, also exported for the remember plugin.
pct=""
if [ -n "$pct_raw" ]; then
    pct=${pct_raw%.*}
    printf '%s' "$pct" > "${TMPDIR:-/tmp}/claude-ctx-pct" 2>/dev/null || true
fi

# --- styling ---------------------------------------------------------------
esc=$'\033'
reset="${esc}[0m"
fg() { printf '%s[38;2;%sm' "$esc" "$1"; }   # truecolor: arg is "R;G;B"

# Nerd Font glyphs (literal UTF-8 bytes so this works on any bash/printf).
G_MODEL=$(printf '\xef\x8b\x9b')   # microchip
G_DIR=$(printf '\xef\x81\xbb')     # folder
G_COST=$(printf '\xef\x85\x95')    # dollar
G_GIT=$(printf '\xef\x82\x9b')     # github mark
G_BRANCH=$(printf '\xee\x82\xa0')  # branch (powerline)
G_THINK=$(printf '\xef\x83\xab')   # lightbulb (thinking)
G_FAST=$(printf '\xef\x83\xa7')    # bolt (fast mode)
G_EFFORT=$(printf '\xef\x83\xa4')  # tachometer (effort)
FULL=$(printf '\xe2\x96\x88')      # block █
LIGHT=$(printf '\xe2\x96\x91')     # light shade ░

# Catppuccin Latte palette (truecolor "R;G;B").
col_model="30;102;245"    # blue
col_dir="108;111;133"     # subtext0
col_cost="223;142;29"     # yellow
col_add="64;160;43"       # green
col_del="210;15;57"       # red
col_branch="136;57;239"   # mauve
col_dirty="254;100;11"    # peach
col_sep="140;143;161"     # overlay1
col_think="114;135;253"   # lavender
col_fast="254;100;11"     # peach
col_eff_hi="254;100;11"   # peach
col_eff_md="108;111;133"  # subtext0
col_eff_lo="156;160;176"  # overlay0

# Context color ramps with fill level.
ctx_color="64;160;43"                                    # green
if [ -n "$pct" ]; then
    if   [ "$pct" -ge 90 ]; then ctx_color="210;15;57"   # red
    elif [ "$pct" -ge 75 ]; then ctx_color="254;100;11"  # peach
    elif [ "$pct" -ge 50 ]; then ctx_color="223;142;29"  # yellow
    fi
fi

# Human-friendly token count: 1234 -> 1k, 1000000 -> 1M.
kfmt() {
    local n=$1
    [ -z "$n" ] && return
    if   [ "$n" -ge 1000000 ]; then printf '%dM' $((n / 1000000))
    elif [ "$n" -ge 1000 ];    then printf '%dk' $((n / 1000))
    else printf '%d' "$n"
    fi
}

# Join args with the dim separator.
join_segs() {
    local sep=" $(fg "$col_sep")·${reset} " out="" s
    for s in "$@"; do
        [ -n "$out" ] && out="${out}${sep}"
        out="${out}${s}"
    done
    printf '%s' "$out"
}

# --- line 1: model, mode flags, context, cost ------------------------------
line1=()

[ -n "$model" ] && line1+=("$(fg "$col_model")${G_MODEL} ${model}${reset}")

# Mode flags: thinking, fast mode, reasoning effort.
mode_parts=()
[ "$thinking" = "true" ] && mode_parts+=("$(fg "$col_think")${G_THINK}")
[ "$fast_mode" = "true" ] && mode_parts+=("$(fg "$col_fast")${G_FAST}")
if [ -n "$effort" ]; then
    ecol="$col_eff_lo"
    case "$effort" in
        high|xhigh|max) ecol="$col_eff_hi" ;;
        medium) ecol="$col_eff_md" ;;
    esac
    mode_parts+=("$(fg "$ecol")${G_EFFORT} ${effort}")
fi
if [ "${#mode_parts[@]}" -gt 0 ]; then
    m=""
    for p in "${mode_parts[@]}"; do
        [ -n "$m" ] && m="${m} "
        m="${m}${p}"
    done
    line1+=("${m}${reset}")
fi

if [ -n "$pct" ]; then
    # 10-cell fill bar, rounded up to the nearest 10%.
    filled=$(((pct + 9) / 10))
    [ "$filled" -gt 10 ] && filled=10
    bar=""
    i=0
    while [ "$i" -lt 10 ]; do
        if [ "$i" -lt "$filled" ]; then bar="${bar}${FULL}"; else bar="${bar}${LIGHT}"; fi
        i=$((i + 1))
    done
    ctx="$(fg "$ctx_color")${bar} ${pct}%"
    if [ -n "$used_tok" ] && [ -n "$max_tok" ]; then
        ctx="${ctx} $(fg "$col_sep")($(fg "$ctx_color")$(kfmt "$used_tok")/$(kfmt "$max_tok")$(fg "$col_sep"))"
    fi
    line1+=("${ctx}${reset}")
fi

[ -n "$cost" ] && line1+=("$(fg "$col_cost")${G_COST} $(printf '%.2f' "$cost")${reset}")

# --- line 2: folder, repo + branch, lines changed --------------------------
line2=()

basename_dir=${dir##*/}
[ -n "$basename_dir" ] && line2+=("$(fg "$col_dir")${G_DIR} ${basename_dir}${reset}")

# Repo owner/name + current git branch (branch read live from the checkout).
git_seg=""
if [ -n "$repo_owner" ] && [ -n "$repo_name" ]; then
    git_seg="$(fg "$col_dir")${G_GIT} ${repo_owner}/${repo_name}"
fi
if [ -n "$dir" ]; then
    branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
        dirty=""
        if ! git -C "$dir" diff --quiet 2>/dev/null ||
           ! git -C "$dir" diff --cached --quiet 2>/dev/null; then
            dirty="$(fg "$col_dirty")*"
        fi
        [ -n "$git_seg" ] && git_seg="${git_seg} "
        git_seg="${git_seg}$(fg "$col_branch")${G_BRANCH} ${branch}${dirty}"
    fi
fi
[ -n "$git_seg" ] && line2+=("${git_seg}${reset}")

added=${added:-0}
removed=${removed:-0}
if [ "$added" != "0" ] || [ "$removed" != "0" ]; then
    line2+=("$(fg "$col_add")+${added}$(fg "$col_sep")/$(fg "$col_del")-${removed}${reset}")
fi

# --- emit (line 2 first: location/changes, then model/session) -------------
out1=$(join_segs ${line1[@]+"${line1[@]}"})
out2=$(join_segs ${line2[@]+"${line2[@]}"})
[ -n "$out2" ] && printf '%s\n' "$out2"
[ -n "$out1" ] && printf '%s\n' "$out1"
