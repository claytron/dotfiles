# shellcheck shell=bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Enable MacPorts provided bash completions
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    source /opt/local/etc/profile.d/bash_completion.sh
fi

## User specific aliases and functions

# set up common env vars between bourne shells
source ~/.commonenv

# set up common aliases between bourne shells
source ~/.commonrc

# seriously, i want to use vi
set -o vi
# ^n cycle through the list of partial matches
bind -m vi-insert "\`":menu-complete
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line

# history settings
export HISTFILE=$HOME/.bash_history
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=1000
# don't clear the history each time
shopt -s histappend

# Set up the prompt

# Only show user in the prompt if it isn't yourself
# Make sure and set the $ME var
ME="clayton"
PR_IMPOSTER=""
if [ "$(whoami)" != $ME ]; then
   PR_IMPOSTER="\n(\u)"
fi

# prompt will look like this:
#
# Tue Apr 28 00:38 | ~/Desktop
# clyde$
#
# and like this if I'm not me :)
#
# (notme)
# Tue Apr 28 00:38 | ~/Desktop
# clyde$

PS1="$PR_IMPOSTER\n\d \A | \w\n\h\$ "

# load up server specific extras
source ~/.bash_extras

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
