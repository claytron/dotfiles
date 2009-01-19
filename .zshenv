. $HOME/.commonenv

###################################
#     Here we set the PATH:       #
###################################

# from http://zsh.dotsrc.org/Contrib/startup/users/debbiep/dot.zshenv
# rationalize-path()
# Later we'll need to trim down the paths that follow because the ones
# given here are for all my accounts, some of which have unusual
# paths in them.  rationalize-path will remove
# nonexistent directories from an array.
rationalize-path () {             
  # Note that this works only on arrays, not colon-delimited strings.
  # Not that this is a problem now that there is typeset -T.
  local element
  local build
  build=()
  # Evil quoting to survive an eval and to make sure that
  # this works even with variables containing IFS characters, if I'm
  # crazy enough to setopt shwordsplit.
  eval '
  foreach element in "$'"$1"'[@]"
  do
    if [[ -d "$element" ]]
    then
      build=("$build[@]" "$element")
    fi
  done
  '"$1"'=( "$build[@]" )
  '
}

# Include function path in script path so that we can run them even
# though a subshell may not know about functions.
# PATH should already be exported, but in case not. . .
path=(
  "$HOME/bin/$MACHTYPE-$OSTYPE"
  "$HOME/bin"
  /opt/local/bin
  /opt/local/sbin
  /opt/local/Library/Frameworks/Python.framework/Versions/2.4/bin
  /sw/bin
  /sw/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/etc
  /sbin
  /etc
  /bin
  /usr/bin
  /usr/sbin
  /usr/ucb
  /usr/bsd
  /usr/libexec
  /Developer/Tools
  /usr/X11R6/bin
  /usr/X11/bin
  /usr/bin/X11
  /usr/local/X11/bin
  /usr/local/contrib/lib/kde/bin
  /usr/local/tex/bin
  /usr/local/lib/zsh/scr
  /usr/local/games
  /usr/games
  "$path[@]"
  "$fpath[@]"
)

export PATH
# Only unique entries please.
typeset -U path
# Remove entries that don't exist on this system.  Just for sanity's
# sake more than anything.
rationalize-path path

# extra per environment settings
. $HOME/.zshenv_extras
