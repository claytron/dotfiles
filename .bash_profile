source $HOME/.commonprofile

# Get the aliases and functions
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
