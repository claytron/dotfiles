#!/usr/bin/env bash
set -euo pipefail

command -v claude >/dev/null || { echo "claude not installed, skipping plugins"; exit 0; }

marketplaces=(
  anthropics/claude-plugins-official
  Digital-Process-Tools/claude-marketplace
)

plugins=(
  remember@dpt-plugins
  claude-md-management@claude-plugins-official
  superpowers@claude-plugins-official
)

for m in "${marketplaces[@]}"; do
  claude plugin marketplace add "$m"
done

for p in "${plugins[@]}"; do
  claude plugin install "$p"
done
