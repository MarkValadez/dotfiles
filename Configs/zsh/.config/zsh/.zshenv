# Language
export LANG=en_US.UTF-8

# Path
export PATH=$HOME/bin:/usr/bin:$PATH  # bin & usr/bin
export PATH=$PATH:$HOME/.local/bin  # local
export PATH=$PATH:$HOME/.cargo/bin  # cargo

# Compilers
export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

# Nix
export NIX="$HOME/.nix-profile/etc/profile.d/nix.sh"

# Zsh
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Antidote
export ANTIDOTE="$HOME/.nix-profile/share/antidote/antidote.zsh"

# Utils
export FZF_BASE="$HOME/.fzf"

# Dotfiles
export CONFIG="$HOME/.config"
export DOTFILES="$CONFIG/dotfiles"
export DOTCONFS="$DOTFILES/Configs"
export DOTHOOKS="$DOTFILES/Hooks"
export DOTSECRETS="$DOTFILES/Secrets"

# ZSH Theme
export STARSHIP_CONFIG="$CONFIG/starship.toml"
