. ~/.commonprofile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# User specific environment and startup programs

# TODO use a fancy path generator like the one in .zshenv
PATH=$PATH:$HOME/bin

export PATH
