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
    
    DIRS_TO_MAKE=(
        "$HOME"/bin
        "$HOME"/.backup
        "$HOME"/.backup/vim/swap
        "$HOME"/.virtualenvs
        "$HOME"/.buildout
        "$HOME"/.buildout/eggs
        "$HOME"/.buildout/downloads
        "$HOME"/.buildout/zope
    )
    
    # create the $DIRS_TO_MAKE
    # -------------------------------------------------------------
    processDotDir() {
        local dot_directory
        dot_directory=$1
        # if we are cleaning up, let's remove the dir
        if [ "$remove" = "cleanup" ]; then
            if [ -d "$dot_directory" ]; then
                echo -n "Are you sure you want to delete $dot_directory? [n]: "
                read REMOVE_DIR
                if [ "$REMOVE_DIR" = "y" ]; then
                    rm -rf "$dot_directory"
                    echo "Deleted $dot_directory"
                fi
            fi
        # if the directory doesn't exist, let's create it
        elif [[ ! -d "$dot_directory" ]] && [[ ! -a "$dot_directory" ]]; then
            mkdir -p "$dot_directory" && echo "created a $dot_directory directory"
            chmod 700 "$dot_directory"
        elif [[ ! -d "$dot_directory" ]] && [[ -a "$dot_directory" ]]; then
            echo "something in the way of $dot_directory being created"
        fi
    }
    
    for dir in "${DIRS_TO_MAKE[@]}"
        do
            processDotDir $dir
        done
    
    # create a buildout directory structure
    # -------------------------------------------------------------
    BUILDOUT_DIR="$HOME"/.buildout
    if [[ ! -d "$BUILDOUT_DIR" ]] && [[ ! -a "$BUILDOUT_DIR" ]]; then
        # create the default.cfg file
        cat > $BUILDOUT_DIR/default.cfg <<EOF
#[buildout]
#eggs-directory = $HOME/.buildout/eggs
#download-cache = $HOME/.buildout/downloads
#zope-directory = $HOME/.buildout/zope

#[instance]
#event-log-level = debug
EOF
        # let the person know they can modify the files
        echo
        echo "A default buildout config has been set up for you in $BUILDOUT_DIR"
        echo "You can modify the $BUILDOUT_DIR/default.cfg to your liking"
        echo
    fi
    
    FILES_TO_MAKE=(
        .pypirc
        .pydistutils.cfg
        .githack
    )
    
    # create some uncontrolled files
    # -------------------------------------------------------------
    processDotFiles() {
        local dot_file
        dot_file=$1
        if [ "$remove" = "cleanup" ]; then
            if [ -e "$dot_file" ]; then
                echo -n "Are you sure you want to delete $dot_file? [n]: "
                read REMOVE_FILE
                if [ "$REMOVE_FILE" = "y" ]; then
                    rm "$dot_file"
                    echo "Deleted $dot_file"
                fi
            fi
        # if the file doesn't exist, let's create it with some content
        elif [ ! -e "$dot_file" ]; then

            # distutils config
            if [ "$dot_file" = ".pydistutils.cfg" ]; then
                (
                cat <<EOF
#[easy_install]
#find_links =
#    http://USERNAME:PASSWORD@skillet.sixfeetup.com/simple
EOF
) > "$HOME/$dot_file"
            fi

            # pypirc
            if [ "$dot_file" = ".pypirc" ]; then
                (
                cat <<EOF
#[distutils]
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
#Password: PASSWORD
EOF
) > "$HOME/$dot_file"
            fi

            # my crazy git hack to add these items to the .gitconfig
            if [ "$dot_file" = ".githack" ]; then
                (
                cat <<'EOF'
`git config --global github.user claytron`
`git config --global github.token YOUR_TOKEN_HERE`
`git config --global core.excludesfile ~/.gitignore`
EOF
) > "$HOME/$dot_file"
            fi
        echo "Created $dot_file example"
        chmod 600 $dot_file
        fi
    }
    
    for dot_file in "${FILES_TO_MAKE[@]}"
        do
            processDotFiles $dot_file
        done
    
fi
