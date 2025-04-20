# def essential env
export NIX="$HOME/.nix-profile/etc/profile.d/nix.sh"
export ZDOTDIR="$HOME/.config/zsh"

# init nix
source $NIX

# init zshenv in dotfiles
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
