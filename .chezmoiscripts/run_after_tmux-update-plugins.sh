#!/usr/bin/env bash
set -euo pipefail

echo "Update tmux plugins"

tpack install
tpack update
tpack clean

# Re-apply fd-redirect fix: tmux-dark-notify's main.tmux backgrounds its runner as
# `$RUNNER &`, which inherits run-shell's pipe and never closes it, so the first tmux
# start hangs forever. tpack update clobbers the fix, so re-patch after every update.
#
# Self-retiring: fail loudly if the buggy line is gone AND our patch isn't there,
# which means upstream changed main.tmux and this workaround should be removed.
for f in "$HOME"/.tmux/plugins/tmux-dark-notify-*/main.tmux; do
    if grep -q '^\$RUNNER &$' "$f"; then
        perl -i -pe 's{^\$RUNNER &\s*$}{\$RUNNER >/dev/null 2>&1 </dev/null &\n}' "$f"
        echo "Patched dark-notify fd-redirect hang fix into $f"
    elif grep -q '^\$RUNNER >/dev/null 2>&1 </dev/null &$' "$f"; then
        : # already patched
    else
        echo "ERROR: dark-notify main.tmux no longer matches the known \$RUNNER line." >&2
        echo "       Upstream likely fixed the hang — remove this workaround. See $f" >&2
        exit 1
    fi
done
