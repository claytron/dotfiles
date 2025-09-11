#!/usr/bin/env bash

# Install vim plugins
\vim -c PlugInstall -c qa
\vim -c PlugUpdate -c qa

nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa
