#  Modified from @carlosala's ohmyzsh/ohmyzsh/plugins/gh

#  Autocompletion for the Jetify's Devbox CLI (devbox).
if (( ! $+commands[astro] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `astro`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_astro" ]]; then
  typeset -g -A _comps
  autoload -Uz _astro
  _comps[astro]=_astro
fi

astro completion zsh >| "$ZSH_CACHE_DIR/completions/_astro" &|
