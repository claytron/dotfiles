#!/usr/bin/env bash
set -euo pipefail

command -v uv >/dev/null || { echo "uv not installed, skipping mempalace"; exit 0; }

# Provides the mempalace CLI and the mempalace-mcp server the agent plugins run
uv tool install --upgrade mempalace
