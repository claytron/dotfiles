#!/usr/bin/env bash

(
    cd ~/.virtualenvs

    if [ ! -d neovim ]; then
      python3 -m venv neovim
    fi

    cd neovim
    bin/pip install -U pip
    bin/pip install pynvim
)

(
    cd ~/.virtualenvs

    if [ ! -d tools ]; then
      python3 -m venv tools
    fi

    cd tools
    bin/pip install -U pip
    bin/pip install black autopep8 flake8 glances yamllint sqlfluff neovim-remote
)
