# * Source

# Configure Dbus
# ! Do not change
# SOURCE: https://www.reddit.com/r/bashonubuntuonwindows/comments/101fn09/do_this_if_you_are_having_problems_with_keyrings/
dbus-update-activation-environment --all > /dev/null 2>&1

# ZSH Options
setopt NO_BEEP            # No beep on error

# call 'compstyle -l' to see options

[[ -f $ANTIDOTE ]] && source $ANTIDOTE
# Antidote Plugins
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=($ANTIDOTE/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

#zstyles

zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identities id_github
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 1h


compinit -d "$ZSH_CACHE_DIR/zcompcache"


