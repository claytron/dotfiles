UNAME=`uname`

. $HOME/.commonfuncs

# Log dir hash
hash -d L=/var/log
hash -d RA=/var/db/rails
hash -d R=/usr/local/etc/rc.d
hash -d Z=/var/db/zope

# OS X specific settings
if [[ $UNAME == "Darwin" ]]; then
    
    # set up dir hashes
    hash -d OB=$HOME/sixfeetup/bundles
    hash -d B=$HOME/Documents/sixfeetup/bundles
    hash -d DB=$HOME/Documents/sixfeetup/bundles-dev
    hash -d DB25=$HOME/Documents/sixfeetup/dev-bundle-2.5
    hash -d OP=$HOME/Documents/sixfeetup/projects
    hash -d EP=/Volumes/MUZAK/zope
    hash -d P=$HOME/sixfeetup/projects
    hash -d P24=/opt/local/Library/Frameworks/Python.framework/Versions/2.4/lib/python2.4/site-packages/
    hash -d S=$HOME/Sites

fi

# set up common aliases between shells
. $HOME/.commonrc

# cvs setup
export CVSROOT=:pserver:clayton@cvs:/var/cvsroot

setopt NO_BEEP
# Changing Directories
setopt AUTO_CD CDABLE_VARS
# History
setopt HIST_SAVE_NO_DUPS HIST_VERIFY HIST_IGNORE_ALL_DUPS EXTENDED_HISTORY
# globbing
#setopt GLOB_DOTS

# use vi mode
bindkey -v
# use home and end instead of ^e and ^a
bindkey -M viins '^[[H' vi-beginning-of-line
bindkey -M viins '^[[F' vi-end-of-line
# use delete as forward delete
bindkey -M viins '\e[3~' vi-delete-char
# OS X?
#bindkey -M viins '^[[3~' vi-delete-char
# line buffer
bindkey -M viins '^B' push-line-or-edit

# set up history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
export HISTFILE HISTSIZE SAVEHIST

# old style completions
compctl -s 'fg kill start logreopen reload shell status wait help logtail restart show stop' instance zopectl zeoserver zeoctl
compctl -s 'fg kill start logreopen reload shell status wait help logtail restart show stop run adduser test debug' instance zopectl

## Completions
autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use some crazy ass shell prompt
# thanks to for the basis: http://aperiodic.net/phil/prompt/
ME="clayton"
. ~/.zshprompt

# load up per environment extras
. ~/.zshextras
