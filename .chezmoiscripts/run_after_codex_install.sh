#!/usr/bin/env bash
# commonenv skips ~/.local/bin if it didn't exist when the shell started.
# Setting it first also stops the installer from appending PATH to ~/.zprofile.
export PATH="$HOME/.local/bin:$PATH"

# Non-interactive skips the "Start Codex now?" prompt
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh
