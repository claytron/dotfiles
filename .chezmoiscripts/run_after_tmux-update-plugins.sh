#!/usr/bin/env bash

echo "Update tmux plugins"

tpack install
tpack update
tpack clean
