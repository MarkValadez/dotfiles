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
curl -L https://nixos.org/nix/install | sh

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
    

# Install Devbox Shell Manager
sudo curl -fsSL https://get.jetify.com/devbox | bash 
sudo groupadd devbox  # Create the devbox group if it doesn't exist
sudo usermod -aG devbox "$USER"  # Add your user to the devbox group
newgrp devbox  # Refresh group membership


# Install Tuckr
cargo install -q --git https://github.com/RaphGL/Tuckr.git
tuckr set \*