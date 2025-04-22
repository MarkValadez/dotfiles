#  Modified from @carlosala's ohmyzsh/ohmyzsh/plugins/gh

#  Autocompletion for the Jetify's Devbox CLI (devbox).
if (( ! $+commands[devbox] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `devbox`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_devbox" ]]; then
  typeset -g -A _comps
  autoload -Uz _devbox
  _comps[gh]=_devbox
fi

devbox completion zsh > "$ZSH_CACHE_DIR/completions/_devbox" &|