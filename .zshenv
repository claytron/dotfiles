source $HOME/.commonenv
source $HOME/.commonfuncs

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

# Take care of setting an FPATH for all occasions.
# Something seems very wrong about all of this

# look for /usr/share version
if [ -d /usr/share/zsh/$ZSH_VERSION ]; then
    fpath+=(/usr/share/zsh/$ZSH_VERSION*/**/*(/))
fi

# look for /usr/local/share
if [ -d /usr/local/share/zsh/$ZSH_VERSION ]; then
    fpath+=(/usr/local/share/zsh/$ZSH_VERSION*/**/*(/))
fi

# look for /opt/local/share
if [ -d /opt/local/share/zsh/$ZSH_VERSION ]; then
    fpath+=(/opt/local/share/zsh/$ZSH_VERSION*/**/*(/))
fi

# Set the lowest common options
fpath+=(
    /opt/zsh/zsh-completions/src
    /opt/zsh/other-completions
    /usr/local/share/zsh/functions
    /usr/local/share/zsh/site-functions
    /usr/share/zsh/site-functions
    /usr/share/zsh/functions
    "$fpath[@]"
)

export FPATH
# Only unique entries please.
typeset -U fpath
# Remove entries that don't exist on this system.  Just for sanity's
# sake more than anything.
rationalize-path fpath

# extra per environment settings (for things like GITHUB_PACKAGE_AUTH, and OBJC_DISABLE_INITIALIZE_FORK_SAFETY)
source $HOME/.zshenv_extras
