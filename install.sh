#!/bin/bash

# shellcheck disable=SC1091

set -e

# Vars
export PATH="$PATH:$HOME/.cargo/bin"
export ZDOTDIR="$HOME/.config/zsh"

# Update and upgrade apt packages
sudo apt update -y || { echo "APT update failed!"; exit 1; } 
sudo apt upgrade -y || { echo "APT upgrade failed!"; exit 1; } 
sudo apt install build-essential libdbus-1-dev pkg-config gnome-keyring dbus-user-session -y

# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

# install packages
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

# Remove .profile
[[ -f $HOME/.profile ]] && rm "$HOME/.profile"

tuckr set \* 

# Add zsh as a login shell & set as default
zsh_path=$(command -v zsh)
grep -Fxq "$zsh_path" "/etc/shells" || { echo "$zsh_path" | sudo tee -a /etc/shells; }
chsh -s "$(which zsh)"

# Create .ssh dir
[[ -d "$HOME/.ssh/" ]] || mkdir "$HOME/.ssh/"

# Create symlink to Windows Downloads dir
[[ -f "./link-downloads.zsh" ]] && . "./link-downloads.sh"

# Install Homebrew
NONINTERACTIVE=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
zsh -c "$(brew install jandedobbeleer/oh-my-posh/oh-my-posh)"

# Install Azure Dev CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Generate Locales
sudo locale-gen en_US.utf8
rustup default stable

zsh




