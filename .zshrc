UNAME=`uname`

. $HOME/.commonfuncs

# Log dir hash
hash -d L=/var/log
hash -d RA=/var/db/rails
hash -d R=/usr/local/etc/rc.d

# OS X specific settings
if [[ $UNAME == "Darwin" ]]; then
    # set up a path in .profile for TextMate (zsh haterz)
    echo "export PATH=$PATH" > $HOME/.profile
    
    # iPhone doesn't have a defaults command...yet
    if checkPath defaults; then
        # also set up the osx path
        # (this will overwrite the PATH everytime we open a shell)
        defaults write $HOME/.MacOSX/environment PATH -string $PATH
        # setting the ACK_OPTIONS env var for TextMate
        # http://code.google.com/p/ack/issues/detail?id=106
        defaults write $HOME/.MacOSX/environment ACK_OPTIONS -string $ACK_OPTIONS
    fi

    # set up dir hashes
    hash -d OB=/Users/clayton/sixfeetup/bundles
    hash -d B=/Users/clayton/Documents/sixfeetup/bundles
    hash -d DB=/Users/clayton/Documents/sixfeetup/bundles-dev
    hash -d DB25=/Users/clayton/Documents/sixfeetup/dev-bundle-2.5
    hash -d OP=/Users/clayton/Documents/sixfeetup/projects
    hash -d EP=/Volumes/MUZAK/zope
    hash -d P=/Users/clayton/sixfeetup/projects
    hash -d Z=/Users/clayton/zope
    hash -d MZ=/Users/clayton/myzope/projects
    hash -d zP=zeo/Products
    hash -d L=/var/log
    hash -d Z27=/Applications/development/Zope
    hash -d Z28=/Applications/development/Zope28
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
. ~/.zshprompt

# load up per environment extras
. ~/.zshextras
