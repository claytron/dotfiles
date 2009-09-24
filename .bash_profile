source $HOME/.commonprofile

# let's set a proper PATH
#########################

# This is an attempt to use a fancy path generator
# like the one in .zshenv
new_path=""
expected_path=(
  "$HOME/bin/$MACHTYPE-$OSTYPE"
  "$HOME/bin"
  /opt/python-macosx/python-2.4/bin
  /opt/local/bin
  /opt/local/sbin
  /opt/local/lib/postgresql83/bin
  /opt/local/Library/Frameworks/Python.framework/Versions/2.4/bin
  /sw/bin
  /sw/sbin
  /usr/bin/perlbin/vendor
  /usr/bin/perlbin/core
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
)

for element in "${expected_path[@]}"
do
  if [ -d $element ]; then
    if [ -z $new_path ]; then
      new_path=$element
    else
      new_path=$new_path:$element
    fi
  fi
done

PATH=$new_path
export PATH

# Get the aliases and functions
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
