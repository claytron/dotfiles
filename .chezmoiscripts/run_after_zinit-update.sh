#!/usr/bin/env zsh

# Update zinit and all plugins/snippets
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
zinit self-update
zinit update
