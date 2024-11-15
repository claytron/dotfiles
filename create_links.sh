#!/usr/bin/env bash

# Exit after first error
set -e

########################################
# This is the list of conf files that we
# want to automagically link after
# checking out to the remote machine
########################################

# 'remove' means to remove the files so they can be linked
# 'cleanup' means to remove all the files created by this script
remove="$1"

dotfiles_loc=$(cd "$(dirname "$0")" && pwd)
excluded=(
    .svn
    .git
    .DS_Store
    .
    ..
    .AppleDouble
)
# make sure the dotfiles are only rwx by the owner
chmod 700 "$dotfiles_loc"
# make sure my home dir is secured
chmod 700 "$HOME"

notExcluded() {
    # check that the value exists
    if [ -z "$1" ]; then
        return
    fi

    for i in "${excluded[@]}"
    do
        if [ "$i" == "$1" ]; then
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
            ln -s "$actual_dotfile" "$to_create"
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
        dotfile=$(echo "$actual_dotfile" | awk -F"$dotfiles_loc/" '{print $2}')
        # ignore certain directories
        if notExcluded "$dotfile"; then
            to_create="$HOME/$dotfile"
            linkDotfile "$dotfile" "$to_create" "$actual_dotfile"
        fi
    done


# TODO: Modify creation script to handle nested directories that
#       aren't under version control.
###################################################################

# make the .subversion dir if it doesn't exist already
[ ! -d "$HOME/.subversion" ] && mkdir "$HOME/.subversion"

# take care of the .subversion/config file
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/config"
dotfile="config"
to_create="$HOME/.subversion/$dotfile"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# take care of the .subversion/servers file
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/servers"
dotfile="servers"
to_create="$HOME/.subversion/$dotfile"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# take care of the ~/.ssh/authorized_keys
# -----------------------------------------------------------------
# make the .ssh dir if it doesn't exist already
[ ! -d "$HOME/.ssh" ] && mkdir "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
actual_dotfile="$dotfiles_loc/authorized_keys"
to_create="$HOME/.ssh/authorized_keys"
# remove the old symlink if it is there
[ -h "$to_create" ] && rm "$to_create" && echo "removed symlink for $to_create"
# Create the file if it doesn't exist
[ ! -e "$to_create" ] && touch "$to_create"
# For each key, see if it exists, if not, add it
while read -r skey; do
if ! grep -q "$skey" "$to_create"; then
      echo "$skey" >> "$to_create"
      key_name=$(echo "$skey" | awk '{print $3}')
      echo "Added $key_name"
  fi
done < "$actual_dotfile"

# Ensure that StrictModes doesn't cause us issues with SSH key auth
if [ -e "$HOME/.ssh/authorized_keys" ]; then
    chmod 600 "$HOME/.ssh/authorized_keys"
fi

# set up app configs
[ -d "$HOME/.config" ] || mkdir "$HOME"/.config

# Take care of awesome configs
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/awesome"
dotfile="awesome"
to_create="$HOME/.config/$dotfile"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# Take care of yamllint configs
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/yamllint"
dotfile="yamllint"
[ -d "$HOME/.config/$dotfile" ] || mkdir "$HOME/.config/$dotfile"
to_create="$HOME/.config/$dotfile/config"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# Take care of neovim config
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/.vim"
dotfile="nvim"
to_create="$HOME/.config/$dotfile"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# Take care of kitty configs
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/kitty.conf"
dotfile="kitty"
[ -d "$HOME/.config/$dotfile" ] || mkdir "$HOME/.config/$dotfile"
to_create="$HOME/.config/$dotfile/$dotfile.conf"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

if [ ! -d "$HOME/.config/kitty/themes" ]; then
  (
    cd "$HOME"/.config/kitty
    git clone -b better-light git@github.com:claytron/papercolor-kitty.git themes
  )
fi

# Choose a kitty theme that's built in
if which kitten >/dev/null; then
    kitten themes --reload-in=all Catppuccin-Latte
fi

if [ ! -d "$HOME/.config/kitty/icons" ]; then
  (
    cd "$HOME"/.config/kitty
    git clone git@github.com:k0nserv/kitty-icon.git icons
  )
fi
kitty_icon=neue_toxic.icns
kitty_icon_link="$HOME"/.config/kitty/kitty.app.icns
[ -L "$kitty_icon_link" ] && rm "$kitty_icon_link"
ln -s "$HOME"/.config/kitty/icons/build/"$kitty_icon" "$kitty_icon_link"

# Take care of ranger config
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/rifle.conf"
dotfile="rifle"
[ -d "$HOME/.config/ranger" ] || mkdir "$HOME/.config/ranger"
to_create="$HOME/.config/ranger/$dotfile.conf"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# Take care of starship config
# -----------------------------------------------------------------
actual_dotfile="$dotfiles_loc/starship.toml"
dotfile="starship"
to_create="$HOME/.config/$dotfile.toml"
# actually create/remove the link
linkDotfile "$dotfile" "$to_create" "$actual_dotfile"

# Take care of vscode configs
# -----------------------------------------------------------------
if [ -d "$HOME/Library/Application Support/Code" ]; then
  actual_dotfile="$dotfiles_loc/vscode_settings.json"
  dotfile="vscode"
  to_create="$HOME/Library/Application Support/Code/User/settings.json"
  # actually create/remove the link
  linkDotfile "$dotfile" "$to_create" "$actual_dotfile"
fi

# Set up bat themes
# -----------------------------------------------------------------
if which bat >/dev/null; then
    [ -d "$(bat --config-dir)" ] || mkdir -p "$(bat --config-dir)"

    theme_dir="$(bat --config-dir)"/themes
    [ ! -d "$theme_dir" ] || mkdir -p "$theme_dir"

    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    wget --quiet -P "$theme_dir" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

    bat cache --build
fi

# Install the vim plugins
which nvim >/dev/null && nvim -c PlugInstall -c qa >/dev/null 2>&1

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
        .tmux.local
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
        "$HOME"/.backup/vim/undo
        "$HOME"/.backup/vim/undo_vim
        "$HOME"/.backup/vim/swap
        "$HOME"/.virtualenvs
        "$HOME"/.buildout
        "$HOME"/.buildout/eggs
        "$HOME"/.buildout/downloads
        "$HOME"/.buildout/zope
        "$HOME"/.buildout/extends
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
            processDotDir "$dir"
        done
fi

if [ ! -d "$HOME/.terraform.d/plugin-cache" ]; then
    echo "Create terraform plugin cache dir"
    mkdir -p "$HOME"/.terraform.d/plugin-cache
fi

if [ ! -d "$HOME/.tmux/plugins" ]; then
    echo "Install TMUX Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d "$HOME/.teamocil" ]; then
    echo "Set up teamocil configs"
    echo "There's no I in Teamocil. At least not where you think"
    git clone git@github.com:claytron/teamocil-config.git ~/.teamocil
fi

if [ ! -d "$HOME/work" ]; then
    mkdir -p "$HOME/work/projects"
    chmod 700 "$HOME/work"
fi

if [ $(defaults read -g com.apple.swipescrolldirection) -eq 1 ]; then
    "$HOME"/.dotfiles/macos_defaults.sh
    echo
    echo "Setting up macos defaults since natural scrolling was on"
    echo "Some settings may require a reboot / or logout"
    echo
fi

# Set up zi / zplugin / zinit
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip
