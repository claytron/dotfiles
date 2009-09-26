#!/usr/bin/env bash

########################################
# This is the list of conf files that we
# want to automagically link after
# checking out to the remote machine
########################################

# 'remove' means to remove the files so they can be linked
# 'cleanup' means to remove all the files created by this script
remove="$1"

dotfiles_loc="$HOME/.dotfiles"
excluded=(
    .svn
    .git
    .gitignore
    .DS_Store
    .
    ..
)
# make sure the dotfiles are only rwx by the owner
chmod 700 $dotfiles_loc

notExcluded() {
    # check that the value exists
    if [ -z "$1" ]; then
        return
    fi
    
    for i in ${excluded[@]}
    do
        if [ $i == $1 ]; then
            # the item exists
            return 1
        fi
    done
    # it did not exist
    return 0
}

linkDotfile() {
    dotfile="$1"
    to_create="$2"
    actual_dotfile="$3"
    # clean up if requested
    if [ "$remove" = "remove" ] || [ "$remove" = "cleanup" ]; then
        if [ -e "$to_create" ]; then
            rm "$to_create"
            echo "Deleted $to_create"
        fi
    else
        # symlink the conf file
        if [ ! -e "$to_create" ]; then
            echo "linking $dotfile"
            ln -s $actual_dotfile $to_create
        fi
        # warn the user that an existing file is in the way
        if [ ! -h "$to_create" -a -e "$to_create" ]; then
            echo "Remove $to_create so that it can be linked"
        fi
    fi
}

# Links all the dotfiles from the .dotfiles directory
# -----------------------------------------------------------------
for actual_dotfile in $HOME/.dotfiles/.*
    do
        dotfile=$(echo $actual_dotfile | awk -F"$dotfiles_loc/" '{print $2}')
        # ignore certain directories
        if notExcluded $dotfile; then
            to_create="$HOME/$dotfile"
            linkDotfile $dotfile $to_create $actual_dotfile
        fi
    done

# take care of the .subversion/config file
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/config"
dotfile="config"
to_create="$HOME/.subversion/$dotfile"
# actually create/remove the link
linkDotfile $dotfile $to_create $actual_dotfile

# NOTE: None of these files are under version control...
# -----------------------------------------------------------------
if [ ! "$remove" = "remove" ]; then
    
    # warn the user what is about to happen
    if [ "$remove" = "cleanup" ]; then
        echo '
******************************************
These files are not under version control
Deleting them will remove them immediately
******************************************
'
    fi
    
    # touch extra files needed by the confs
    # -------------------------------------------------------------
    touch_me=(
        .zsh_history
        .bash_history
        .zshextras
        .zshenv_extras
        .bash_extras
    )
    for to_touch in "${touch_me[@]}"
        do
            TOUCH_FILE="$HOME/$to_touch"
            # if we are cleaning up offer to delete these files
            if [ "$remove" = "cleanup" ]; then
                if [ -e "$TOUCH_FILE" ]; then
                    echo -n "Are you sure you want to delete $TOUCH_FILE? [n]: "
                    read REMOVE_FILE
                    if [ "$REMOVE_FILE" = "y" ]; then
                      rm "$TOUCH_FILE"
                      echo "Deleted $TOUCH_FILE"
                    fi
                fi
            # touch the files if they don't exist
            elif [ ! -e "$TOUCH_FILE" ]; then
                echo "touching $TOUCH_FILE"
                touch "$TOUCH_FILE"
                chmod 600 "$TOUCH_FILE"
            fi
        done
    
    # create a $HOME/bin if it does not exist
    # -------------------------------------------------------------
    HOME_BIN="$HOME/bin"
    # if we are cleaning up, let's remove the dir
    if [ "$remove" = "cleanup" ]; then
        if [ -d "$HOME_BIN" ]; then
            echo -n "Are you sure you want to delete $HOME_BIN? [n]: "
            read REMOVE_DIR
            if [ "$REMOVE_DIR" = "y" ]; then
                rm -rf "$HOME_BIN"
                echo "Deleted $HOME_BIN"
            fi
        fi
    # if the directory doesn't exist, let's create it
    elif [[ ! -d "$HOME_BIN" ]] && [[ ! -a "$HOME_BIN" ]]; then
        mkdir "$HOME_BIN" && echo "created a $HOME_BIN directory"
        chmod 700 "$HOME_BIN"
    elif [[ ! -d "$HOME_BIN" ]] && [[ -a "$HOME_BIN" ]]; then
        echo "something in the way of $HOME_BIN being created"
    fi

    # directories for vim
    # -------------------------------------------------------------
    VIM_BACKUPS="$HOME/.backup"
    # if we are cleaning up, let's remove the dir
    if [ "$remove" = "cleanup" ]; then
        if [ -d "$VIM_BACKUPS" ]; then
            echo -n "Are you sure you want to delete $VIM_BACKUPS? [n]: "
            read REMOVE_DIR
            if [ "$REMOVE_DIR" = "y" ]; then
                rm -rf "$VIM_BACKUPS"
                echo "Deleted $VIM_BACKUPS"
            fi
        fi
    # if the directory doesn't exist, let's create it
    elif [[ ! -d "$VIM_BACKUPS" ]] && [[ ! -a "$VIM_BACKUPS" ]]; then
        mkdir -p "$VIM_BACKUPS/vim/swap" && echo "created a $VIM_BACKUPS directory"
        chmod 700 "$VIM_BACKUPS"
    elif [[ ! -d "$VIM_BACKUPS" ]] && [[ -a "$VIM_BACKUPS" ]]; then
        echo "something in the way of $VIM_BACKUPS being created"
    fi
    
    # create a $HOME/.virtualenvs if it does not exist
    # -------------------------------------------------------------
    VIRTUALENVS="$HOME/.virtualenvs"
    # if we are cleaning up, let's remove the dir
    if [ "$remove" = "cleanup" ]; then
      if [ -d "$VIRTUALENVS" ]; then
          echo -n "Are you sure you want to delete $VIRTUALENVS? [n]: "
          read REMOVE_DIR
          if [ "$REMOVE_DIR" = "y" ]; then
              rm -rf "$VIRTUALENVS"
              echo "Deleted $VIRTUALENVS"
          fi
      fi
    # if the directory doesn't exist, let's create it
    elif [[ ! -d "$VIRTUALENVS" ]] && [[ ! -a "$VIRTUALENVS" ]]; then
        mkdir "$VIRTUALENVS" && echo "created a $VIRTUALENVS directory"
        chmod 700 "$VIRTUALENVS"
    elif [[ ! -d "$VIRTUALENVS" ]] && [[ -a "$VIRTUALENVS" ]]; then
        echo "something in the way of $VIRTUALENVS being created"
    fi
    
    # create a buildout directory structure
    # -------------------------------------------------------------
    BUILDOUT_DIR="$HOME/.buildout"
    # if we are cleaning up, let's remove the dir
    if [ "$remove" = "cleanup" ]; then
        if [ -d "$BUILDOUT_DIR" ]; then
            echo -n "Are you sure you want to delete $BUILDOUT_DIR? [n]: "
            read REMOVE_DIR
            if [ "$REMOVE_DIR" = "y" ]; then
                rm -rf "$BUILDOUT_DIR"
                echo "Deleted $BUILDOUT_DIR"
            fi
        fi
    # if the directory doesn't exist, let's create it with some content
    elif [[ ! -d "$BUILDOUT_DIR" ]] && [[ ! -a "$BUILDOUT_DIR" ]]; then
        mkdir "$BUILDOUT_DIR" && echo "created a $BUILDOUT_DIR directory"
        mkdir "$BUILDOUT_DIR/eggs"
        mkdir "$BUILDOUT_DIR/downloads"
        mkdir "$BUILDOUT_DIR/zope"
        # create the default.cfg file
        # XXX this is fugly
        echo "#[buildout]" >> "$BUILDOUT_DIR/default.cfg"
        echo "#eggs-directory = $HOME/.buildout/eggs" >>"$BUILDOUT_DIR/default.cfg"
        echo "#download-cache = $HOME/.buildout/downloads" >>"$BUILDOUT_DIR/default.cfg"
        echo "#zope-directory = $HOME/.buildout/zope" >> "$BUILDOUT_DIR/default.cfg"
        echo >> "$BUILDOUT_DIR/default.cfg"
        echo "#[instance]" >> "$BUILDOUT_DIR/default.cfg"
        echo "#event-log-level = debug" >> "$BUILDOUT_DIR/default.cfg"
        chmod 700 "$BUILDOUT_DIR"
        # let the person know they can modify the files
        echo
        echo "A default buildout config has been set up for you in $BUILDOUT_DIR"
        echo "You can modify the $BUILDOUT_DIR/default.cfg to your liking"
        echo
    elif [[ ! -d "$BUILDOUT_DIR" ]] && [[ -a "$BUILDOUT_DIR" ]]; then
        echo "something in the way of $BUILDOUT_DIR being created"
    fi
    
    # create a dummy .pypirc
    # -------------------------------------------------------------
    PYPIRC="$HOME/.pypirc"
    if [ "$remove" = "cleanup" ]; then
        if [ -e "$PYPIRC" ]; then
            echo -n "Are you sure you want to delete $PYPIRC? [n]: "
            read REMOVE_FILE
            if [ "$REMOVE_FILE" = "y" ]; then
                rm "$PYPIRC"
                echo "Deleted $PYPIRC"
            fi
        fi
    # if the file doesn't exist, let's create it with some content
    elif [ ! -e "$PYPIRC" ]; then
        echo '#[distutils]
#index-servers = 
#    pypi
#    skillet
#    plone.org
#
#[pypi]
#Username: USERNAME
#Password: PASSWORD
#
#[skillet]
#repository: http://skillet.sixfeetup.com
#Username: USERNAME
#Password: PASSWORD
#
#[plone.org]
#repository: http://plone.org/products
#Username: USERNAME
#Password: PASSWORD' > $PYPIRC
    echo "Created .pypirc example"
    chmod 600 $PYPIRC
    fi
    
    # create a dummy .pydistutils.cfg
    # -------------------------------------------------------------
    PYDISTUTILS_CFG="$HOME/.pydistutils.cfg"
    if [ "$remove" = "cleanup" ]; then
        if [ -e "$PYDISTUTILS_CFG" ]; then
            echo -n "Are you sure you want to delete $PYDISTUTILS_CFG? [n]: "
            read REMOVE_FILE
            if [ "$REMOVE_FILE" = "y" ]; then
                rm "$PYDISTUTILS_CFG"
                echo "Deleted $PYDISTUTILS_CFG"
            fi
        fi
    # if the file doesn't exist, let's create it with some content
    elif [ ! -e "$PYDISTUTILS_CFG" ]; then
        echo '#[easy_install]
#find_links =
#    http://USERNAME:PASSWORD@skillet.sixfeetup.com/simple' > $PYDISTUTILS_CFG
    echo "Created .pydistutils.cfg example"
    chmod 600 $PYDISTUTILS_CFG
    fi

fi
