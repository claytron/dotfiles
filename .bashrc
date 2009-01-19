## .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

## User specific aliases and functions

# set up common env vars between bourne shells
. $HOME/.commonenv

# set up common aliases between bourne shells
. $HOME/.commonrc

PS1='\n\d \A \w\n\h$ '

# load up server specific extras
. ~/.bash_extras
