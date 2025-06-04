#!/usr/bin/env bash

touch_me=(
    .zsh_history
    .bash_history
)

for new_file in "${touch_me[@]}"; do
    touch "$new_file"
done

dirs_to_make=(
    "$HOME"/bin
    "$HOME"/.backup
    "$HOME"/.backup/vim/undo
    "$HOME"/.backup/vim/undo_vim
    "$HOME"/.backup/vim/swap
    "$HOME"/.virtualenvs
    "$HOME"/.buildout
    "$HOME"/.buildout/eggs
    "$HOME"/.buildout/downloads
    "$HOME"/.buildout/zope
    "$HOME"/.buildout/extends
    "$HOME"/work/projects
)

for directory in "${dirs_to_make[@]}"; do
    mkdir -p "$directory"
done

# TODO: maybe with chezmoi?
chmod 700 "$HOME"/work
