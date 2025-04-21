# def essential env
export NIX_SH="$HOME/.nix-profile/etc/profile.d/nix.sh"
export ZDOTDIR="$HOME/.config/zsh"

# init zshenv in dotfiles
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
