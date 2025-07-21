#!/usr/bin/env bash
set -euxo pipefail

# --- environment tweaks for Docker builds ---
export HOME=/root
export PATH="$PATH:$HOME/.cargo/bin"
export ZDOTDIR="$HOME/.config/zsh"
export DEBIAN_FRONTEND=noninteractive
export NONINTERACTIVE=1

# --- update & install OS packages ---
apt-get update -y
apt-get upgrade -y
apt-get install -y --no-install-recommends \
    build-essential libdbus-1-dev pkg-config \
    gnome-keyring dbus-user-session seahorse \
    libglib2.0-0 curl locales ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# --- install Nix (no daemon) ---
sh <(curl -fsSL https://nixos.org/nix/install) --no-daemon

# load nix into this shell
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

# --- install your Nix packages ---
nix-env -iA \
    nixpkgs.antidote \
    nixpkgs.bat \
    nixpkgs.rustup \
    nixpkgs.devbox \
    nixpkgs.direnv \
    nixpkgs.eza \
    nixpkgs.fzf \
    nixpkgs.gh \
    nixpkgs.git \
    nixpkgs.jq \
    nixpkgs.libgccjit \
    nixpkgs.neovim \
    nixpkgs.python312Full \
    nixpkgs.ripgrep \
    nixpkgs.tmux \
    nixpkgs.tuckr \
    nixpkgs.uv \
    nixpkgs.zsh \
    nixpkgs.gdal \
    nixpkgs.gnumake \
    nixpkgs.gnupg \
    nixpkgs.postgresql_17_jit \
    nixpkgs.shellcheck \
    nixpkgs.starship \
    nixpkgs.wget \
    nixpkgs.xsel \
    nixpkgs.zoxide

# --- clean up old profile ---
rm -f "$HOME/.profile"

# --- install your zsh dotfiles & run their installer ---
mkdir -p "$ZDOTDIR"
git clone https://github.com/MarkValadez/dotfiles.git "$ZDOTDIR"
"$ZDOTDIR/install.sh"

# make zsh available as a login shell
echo "$(which zsh)" >> /etc/shells

# prepare SSH dir
mkdir -p "$HOME/.ssh"

# --- Azure Dev CLI (Linux) ---
curl -fsSL https://aka.ms/install-azd.sh | bash

# --- locale & default shell ---
locale-gen en_US.UTF-8
SHELL="$(which zsh)"
export SHELL