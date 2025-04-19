export ZDOTDIR="$HOME/.config/zsh"
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
if [ -e /home/mvaladez/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mvaladez/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
