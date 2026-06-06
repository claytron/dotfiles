#!/usr/bin/env bash

# Install pi.dev only if not already installed
if ! command -v pi &>/dev/null; then
    curl -fsSL https://pi.dev/install.sh | sh
fi

# Install plugins
pi install npm:pi-mcp-adapter
pi install npm:pi-setup-custom-providers
pi install git:github.com/otahontas/pi-coding-agent-catppuccin
