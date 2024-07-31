source $HOME/.commonfuncs

# Set up zi / zplugin / zinit
typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"
# zi completions
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# load all the zi plugins
source $HOME/.zsh_plugins

# set up dir hashes
hash -d L=/var/log
hash -d P=$HOME/work/projects
hash -d PP=$HOME/work/presentation
hash -d D=$HOME/Documents
[ -d "$HOME/Sites" ] && hash -d S=$HOME/Sites
[ -d /data ] && hash -d Z=/data

# set up common aliases between shells (stuff like rbenv, nvm, pyenv, asdf etc.)
source $HOME/.commonrc

## global aliases
# disable the plonesite part in a buildout run, example: $ bin/buildout -N psef
alias -g psef="plonesite:enabled=false"
# replace the plonesite in a buildout run, example: $ bin/buildout -N pssr
alias -g pssr="plonesite:site-replace=true"
# easily get to the site packages dir of any python install, example: $ cd $(python2.5 site-packages)
alias -g site-packages='-c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'

# some pipes
if [ $(uname) = "Darwin" ]; then
  alias -g S='| sed -Ee'
  alias -g SP='| sed -n -Ee'
else
  alias -g S='| sed -re'
  alias -g SP='| sed -n -re'
fi
alias -g A='| awk'
alias -g G='| grep -Ei'
alias -g C='| cut'
alias -g CF='| cut -d" " -f'
alias -g L='| less'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'
alias -g W='| wc'
alias -g WL='| wc -l'
alias -g JQ='| jq -r'

# copying
if checkPath clipboard; then
    alias -g CP='| clipboard'
elif checkPath pbcopy; then
    alias -g CP='| pbcopy'
elif checkPath xclip; then
    alias -g CP='| xclip -i -selection clipboard'
elif checkPath xsel; then
    alias -g CP='| xsel -ib'
fi

# Diffing
if checkPath colordiff; then
    alias -g CD='| colordiff'
else
    alias -g CD='| vim -R "+syntax on" -'
fi
alias -g pretty_json="| python -mjson.tool | vim -R +'set ft=javascript' -"

# moreutils
alias -g VI='| vipe'
alias -g TS='| ts -i'

# fuzzy finder
alias -g FZ='| fzf -m'
alias -g FZF='| fzf -m'

# automatically print timing statistics if the command took longer
# than a minute
export REPORTTIME=60

setopt NO_BEEP
# Changing Directories
setopt AUTO_CD 
setopt CDABLE_VARS
setopt AUTO_PUSHD
setopt PUSHDMINUS
setopt PUSHD_IGNORE_DUPS
# Include dot files in globbing
# use the following to ignore dot files: % ^.*
setopt GLOB_DOTS

# History
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
alias histappend="fc -AI"
alias histread="fc -R"

# set up the history-complete-older and newer
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# use vi mode
bindkey -v

# Use jj for ESC
bindkey "jj" vi-cmd-mode
bindkey "jk" vi-cmd-mode
# use home and end in addition to ^e and ^a
bindkey -M viins '^A' vi-beginning-of-line
bindkey -M viins '^E' vi-end-of-line
bindkey -M viins '^[[H' vi-beginning-of-line
bindkey -M viins '^[[F' vi-end-of-line
# use delete as forward delete
bindkey -M viins '\e[3~' vi-delete-char
# line buffer
bindkey -M viins '^B' push-line-or-edit
# change the '-' for up in history, always kills my command editing.
bindkey -M vicmd '^[OA' vi-up-line-or-history
# Make sure that shift-tab doesn't take me out of insert mode. going to the
# end of the line will work 99% of the time.
bindkey -M viins '^[[Z' vi-end-of-line
# change the shortcut for expand alias
bindkey -M viins '^X' _expand_alias
# Search backwards with a pattern
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^F' history-incremental-pattern-search-forward
# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

# whole line completion with zsh-users/zsh-history-substring-search plugin
bindkey -M viins "^[OA" history-substring-search-up
bindkey -M viins "^[[A" history-substring-search-up
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-up
bindkey -M viins "^[OB" history-substring-search-down
bindkey -M viins "^[[B" history-substring-search-down

bindkey -M viins "^N" up-line-or-search
bindkey -M viins "^P" down-line-or-search

# edit current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# set up history
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
export HISTFILE HISTSIZE SAVEHIST

# Append history after 30 minutes of inactivity
export TMOUT=900
function TRAPALRM() { histappend }

## Completions
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# custom completions
if [ -d '/usr/share/games/fortunes' ]; then
  compctl -s '$(\ls /usr/share/games/fortunes | grep .dat | sed "s/.dat//")' fortune makeMeLaugh lulz
fi

# make sure git-achievements can complete like git
compdef git-achievements=git

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use starship prompt if it's available
if checkPath starship; then
  eval "$(starship init zsh)"

  function precmd {
    # make sure that all new commands are available
    rehash
  }
else
  if checkPath git and checkPath python; then
      # Make git status information available
      export ZSH_THEME_GIT_PROMPT_NOCACHE="True"
      source ~/.zsh/git-prompt/gitstatus.sh
  else
      alias git_super_status='echo'
  fi

  # use some crazy ass shell prompt
  # thanks to for the basis: http://aperiodic.net/phil/prompt/
  ME="clayton"
  source ~/.zshprompt
fi

# load up per environment extras
source ~/.zshextras

# Set up zsh highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)
# set up command line syntax highlighting overrides
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,underline'
ZSH_HIGHLIGHT_STYLES[alias]='fg=black,bg=green'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=black,bold,bg=blue'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=black,bold,bg=blue'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Advanced shell history
if checkPath atuin; then
  eval "$(atuin init zsh)"
fi
