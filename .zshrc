UNAME=$(uname)
source $HOME/.commonfuncs

# Log dir hash
hash -d L=/var/log
hash -d RA=/var/db/rails
hash -d R=/usr/local/etc/rc.d
hash -d Z=/var/db/zope

# OS X specific settings
if [ $UNAME = "Darwin" ]; then
    
    # set up dir hashes
    hash -d OB=$HOME/sixfeetup/bundles
    hash -d B=$HOME/Documents/sixfeetup/bundles
    hash -d DB=$HOME/Documents/sixfeetup/bundles-dev
    hash -d DB25=$HOME/Documents/sixfeetup/dev-bundle-2.5
    hash -d OP=$HOME/Documents/sixfeetup/projects
    hash -d EP=/Volumes/MUZAK/zope
    hash -d P=$HOME/sixfeetup/projects
    hash -d S=$HOME/Sites

fi

# set up common aliases between shells
source $HOME/.commonrc

alias qs='~/.dotfiles/create_links.sh;source $HOME/.dotfiles/.zshrc'

## global aliases
# disable the plonesite part in a buildout run, example: $ bin/buildout -N psef
alias -g psef="plonesite:enabled=false"
# easily get to the site packages dir of any python install, example: $ cd $(python2.5 site-packages)
alias -g site-packages='-c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
# SVN repos
# 
# NOTE: you can expand aliases with "_expand_alias"
#       see bindkey for more info $ bindkey -M viins
alias -g spriv='https://svn.sixfeetup.com/svn/private/'
alias -g spub='https://svn.sixfeetup.com/svn/public/'
alias -g collective='https://svn.plone.org/svn/collective/'

# cvs setup
export CVSROOT=:pserver:clayton@cvs:/var/cvsroot

setopt NO_BEEP
# Changing Directories
setopt AUTO_CD 
setopt CDABLE_VARS
setopt AUTO_PUSHD
# History
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
# Include dot files in globbing
# use the following to ignore dot files: % ^.*
setopt GLOB_DOTS

# use vi mode
bindkey -v
# use home and end in addition to ^e and ^a
bindkey -M viins '^[[H' vi-beginning-of-line
bindkey -M viins '^A' vi-beginning-of-line
bindkey -M viins '^[[F' vi-end-of-line
bindkey -M viins '^E' vi-end-of-line
# use delete as forward delete
bindkey -M viins '\e[3~' vi-delete-char
# line buffer
bindkey -M viins '^B' push-line-or-edit
# change the '-' for up in history, always kills my command editing.
bindkey -M vicmd '^[OA' vi-up-line-or-history

# edit current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# tetris!!
autoload -U tetris
zle -N tetris
bindkey "^t" tetris

# set up history
HISTSIZE=3000
SAVEHIST=3000
HISTFILE=~/.zsh_history
export HISTFILE HISTSIZE SAVEHIST

## old style completions
# supervisor
if checkPath supervisorctl; then
    # set up completions for supervisor
    compctl -s "$(supervisorctl status | awk -F' ' '{print $1}')" supervisorctl
fi
# zope
compctl -s 'fg kill start logreopen reload shell status wait help logtail restart show stop' zeoserver zeoctl
compctl -s 'fg kill start logreopen reload shell status wait help logtail restart show stop run adduser test debug' instance zopectl

## Completions
autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use some crazy ass shell prompt
# thanks to for the basis: http://aperiodic.net/phil/prompt/
ME="clayton"
source ~/.zshprompt

# load up per environment extras
source ~/.zshextras
