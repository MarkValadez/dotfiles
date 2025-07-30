#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login exists.

# The default umask is set in /etc/profile.
# For setting the umask for ssh logins, install and configure the libpam-umask package.
# umask 022

# If running bash, source ~/.bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        # shellcheck source=/dev/null
        . "$HOME/.bashrc"
    fi
fi

# Add user's private bin directories to PATH if they exist
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# # Source Nix profile if installed
# if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
#    # shellcheck source=/dev/null
#    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
# fi

# Source ~/.local/bin/env if it exists
if [ -f "$HOME/.local/bin/env" ]; then
    # shellcheck source=/dev/null
    . "$HOME/.local/bin/env"
fi

export PATH

if [ -f "$HOME/.zshenv" ]; then
    . "$HOME/.zshenv"
fi

