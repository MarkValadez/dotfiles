# Language
export LANG=en_US.UTF-8

# Path
export PATH=$HOME/bin:/usr/bin:$PATH  # bin & usr/bin
export PATH=$PATH:$HOME/.local/bin  # local
export PATH=$PATH:$HOME/.cargo/bin  # cargo

# Compilers
export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

# Zsh
export ZDOTDIR="$HOME/.config/zsh"
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

# Pager settings
export PAGER="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RF"
export BAT_STYLE="plain"
export BAT_THEME="ansi"
export GIT_PAGER="bat"

# Additional BAT enhancements
export BAT_TABS="4"
export BAT_CONFIG_PATH="$CONFIG/bat/config"

# Enhanced Less configuration
export LESS="-R --mouse --wheel-lines=3"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# History improvements
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTCONTROL=ignoreboth:erasedups
