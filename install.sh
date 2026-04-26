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

# Linux (Debian/Ubuntu): install build deps and 1Password before Homebrew.
# 1Password (the GUI app) provides the SSH agent used to clone the repo.
if [ "$OS" = "Linux" ] && [ -f /etc/debian_version ]; then
    ARCH="$(dpkg --print-architecture)"

    if ! command -v brew >/dev/null 2>&1; then
        echo "Installing Linux prerequisites..."
        sudo apt-get update
        sudo apt-get install -y build-essential procps curl file git ssh gnome-keyring gpg unzip
    fi

    if [ ! -d /opt/1Password ]; then
        case "$ARCH" in
            amd64)
                echo "Setting up 1Password apt repo..."
                curl -sS https://downloads.1password.com/linux/keys/1password.asc \
                    | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
                echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main" \
                    | sudo tee /etc/apt/sources.list.d/1password.list
                sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
                curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol \
                    | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
                sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
                curl -sS https://downloads.1password.com/linux/keys/1password.asc \
                    | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
                sudo apt-get update
                sudo apt-get install -y 1password 1password-cli
                ;;
            arm64)
                # No Debian repo for arm64; install the GUI app from the tarball.
                echo "Installing 1Password from tarball (arm64)..."
                tmpdir="$(mktemp -d)"
                curl -fsSL -o "$tmpdir/1password.tar.gz" \
                    https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
                tar -xzf "$tmpdir/1password.tar.gz" -C "$tmpdir"
                installer="$(find "$tmpdir" -maxdepth 2 -name install.sh -type f | head -1)"
                if [ -z "$installer" ]; then
                    echo "Error: could not find install.sh inside 1Password tarball" >&2
                    rm -rf "$tmpdir"
                    exit 1
                fi
                sudo "$installer"
                rm -rf "$tmpdir"
                ;;
            *)
                echo "Warning: unsupported arch '$ARCH'; install 1Password manually" >&2
                ;;
        esac
    fi

    # 1Password CLI on arm64 has no apt repo either; install the binary directly.
    # Bump OP_VERSION when needed: https://app-updates.agilebits.com/product_history/CLI2
    if [ "$ARCH" = "arm64" ] && ! command -v op >/dev/null 2>&1; then
        OP_VERSION="v2.30.3"
        echo "Installing 1Password CLI ${OP_VERSION} (arm64)..."
        cli_tmp="$(mktemp -d)"
        curl -fsSL -o "$cli_tmp/op.zip" \
            "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_VERSION}/op_linux_arm64_${OP_VERSION}.zip"
        unzip -q "$cli_tmp/op.zip" -d "$cli_tmp"
        sudo install -m 755 "$cli_tmp/op" /usr/local/bin/op
        rm -rf "$cli_tmp"
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
exec chezmoi init --apply --ssh --branch better-bootstrap claytron
