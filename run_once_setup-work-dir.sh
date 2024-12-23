#!/usr/bin/env bash

if [ ! -d "$HOME/work" ]; then
    echo "Set up work projects dir"
    mkdir -p "$HOME/work/projects"
    chmod 700 "$HOME/work"
fi
