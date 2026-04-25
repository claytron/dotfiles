#!/bin/sh

set -e

OS="$(uname -s)"

echo "Bootstrapping dotfiles via chezmoi..."

# macOS: ensure Xcode Command Line Tools are present (provides git).
if [ "$OS" = "Darwin" ]; then
    if ! xcode-select -p >/dev/null 2>&1; then
        echo "Triggering Xcode Command Line Tools install..."
        xcode-select --install || true
        echo
        echo "A GUI dialog should appear to install the Xcode CLT."
        echo "Re-run this script after the install completes."
        exit 1
    fi
fi

# Linux (Debian/Ubuntu): install build deps and 1Password CLI repo
# before Homebrew, matching the prior bootstrap behavior.
if [ "$OS" = "Linux" ] && [ -f /etc/debian_version ]; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "Installing Linux prerequisites..."
        sudo apt-get update
        sudo apt-get install -y build-essential procps curl file git ssh gnome-keyring gpg

        if ! command -v op >/dev/null 2>&1; then
            echo "Setting up 1Password CLI apt repo..."
            curl -sS https://downloads.1password.com/linux/keys/1password.asc \
                | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" \
                | sudo tee /etc/apt/sources.list.d/1password.list
            sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
            curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol \
                | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
            sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
            curl -sS https://downloads.1password.com/linux/keys/1password.asc \
                | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
            sudo apt-get update
            sudo apt-get install -y 1password-cli
        fi
    fi
fi

# Install Homebrew if missing.
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Source brew shellenv so brew, and anything it installs, is on PATH.
if [ "$OS" = "Darwin" ]; then
    if [ -x "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x "/usr/local/bin/brew" ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
elif [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install chezmoi via brew so we get the same version everywhere.
if ! command -v chezmoi >/dev/null 2>&1; then
    echo "Installing chezmoi..."
    brew install chezmoi
fi

echo "Running chezmoi init..."
exec chezmoi init --apply --ssh claytron
