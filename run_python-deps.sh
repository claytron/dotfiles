#!/usr/bin/env bash

(
    cd ~/.virtualenvs

    if [ ! "$(which virtualenv)" ]; then
        pip2 install virtualenv
        asdf reshim
    fi

    if [ ! -d neovim-py2 ]; then
      virtualenv neovim-py2
    fi

    cd neovim-py2
    bin/pip install -U pip
    bin/pip install neovim
)

(
    cd ~/.virtualenvs

    if [ ! -d neovim ]; then
      python3 -m venv neovim
    fi

    cd neovim
    bin/pip install -U pip
    bin/pip install neovim
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
