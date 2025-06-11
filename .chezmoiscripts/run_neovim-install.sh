#!/usr/bin/env bash

# XXX: This is temporary, will set up a proper neovim config
ln -s ~/.vim ~/.config/nvim || true
ln -s ~/.vimrc ~/.config/nvim/init.vim || true

which nvim >/dev/null && nvim -c PlugInstall -c qa >/dev/null 2>&1
