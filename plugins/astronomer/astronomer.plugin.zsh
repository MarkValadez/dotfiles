# Autocompletion for Astronomer’s astro CLI
if (( ! $+commands[astro] )); then
  return
fi

# If the completion file doesn’t exist yet, generate it and bind it to `astro`.
# Otherwise, compinit will have already loaded it.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_astro" ]]; then
  typeset -g -A _comps
  autoload -Uz _astro
  _comps[astro]=_astro
fi

# (Re)generate completion spec in the cache dir in case astro was upgraded.
astro completion zsh >| "$ZSH_CACHE_DIR/completions/_astro" &
