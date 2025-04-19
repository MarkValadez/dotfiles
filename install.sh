#!/bin/bash

# shellcheck disable=SC1091

set -e

# Vars
export PATH="$PATH:$HOME/.cargo/bin"
export ZDOTDIR="$HOME/.config/zsh"

# Update and upgrade apt packages
sudo apt update -y || { echo "APT update failed!"; exit 1; } 
sudo apt upgrade -y || { echo "APT upgrade failed!"; exit 1; } 

# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

. "$HOME/.nix-profile/etc/profile.d/nix.sh"

# install packages
nix-env -iA \
	nixpkgs.antidote \
	nixpkgs.bat \
	nixpkgs.cargo \
	nixpkgs.direnv \
	nixpkgs.fzf \
	nixpkgs.gcc \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.ripgrep \
	nixpkgs.tmux \
	nixpkgs.tuckr \
	nixpkgs.zsh \
    nixpkgs.gdal \
    nixpkgs.gnumake \
    nixpkgs.gnupg \
    nixpkgs.llvmPackages_19.clang-tools \
    nixpkgs.postgresql_17_jit \
    nixpkgs.shellcheck \
    nixpkgs.starship \
    nixpkgs.wget \
    nixpkgs.xsel \
    nixpkgs.zoxide

tuckr set \* 

# Install Devbox Shell Manager
nix profile install github:jetify-com/devbox/latest
# sudo groupadd devbox  # Create the devbox group if it doesn't exist
# sudo usermod -aG devbox "$USER"  # Add your user to the devbox group
# newgrp devbox  # Refresh group membership

# Add zsh as a login shell
zsh_path=$(command -v zsh)
if ! grep -Fxq "$zsh_path" /etc/shells; then
    echo "$zsh_path" | sudo tee -a /etc/shells
fi