#!/usr/bin/env bash
if [ ! -d "$HOME/.teamocil" ]; then
    echo "Set up teamocil configs"
    echo "There's no I in Teamocil. At least not where you think"
    git clone git@github.com:claytron/teamocil-config.git ~/.teamocil
fi
