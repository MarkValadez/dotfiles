# Nix
[[ -f $NIX_SH ]] && source $NIX_SH
export NIX_PROFILE="$HOME/.nix-profile"
export NIX_BIN="$NIX_PROFILE/bin"

# Locales
export LANG="en_US.utf8"

# Editors
export EDITOR="code"

# Path
TMP=$PATH
export PATH="$HOME/.nix-profile/bin" 
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"  # nix
export PATH="$PATH:$HOME/bin:/usr/bin"  # bin & usr/bin
export PATH="$PATH:$HOME/.local/bin"  # local
export PATH="$PATH:$HOME/.cargo/bin"  # cargo
export PATH="$PATH:$TMP"

# Compilers
export cc="$NIX_BIN/gcc"
export cxx="$NIX_BIN/g++"

# Brew
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}"
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

# Zsh
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
export ZSH_COMPLETIONS="$ZSH_CACHE_DIR/completions"
[[ -d "$ZSH_COMPLETIONS" ]] || mkdir -p "$ZSH_COMPLETIONS"

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
export OMP="$DOTBREW/opt/oh-my-posh"
export OMPTHEMES="$OMP/themes"
export STARSHIP_CONFIG="$CONFIG/starship/theme.toml"
export POSH_THEME="$CONFIG/ohmyposh/theme.omp.json"

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
export HISTFILE="$ZSH_CACHE_DIR/zsh_history"
