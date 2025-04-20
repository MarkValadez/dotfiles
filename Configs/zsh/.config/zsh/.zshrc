# * Source 
# Nix Env
[[ -f $NIX ]] && source $NIX

# Initialize completion system first
autoload -Uz compinit
compinit

# ZSH Options
setopt PROMPT_SUBST        # Enable prompt substitution
setopt NO_BEEP            # No beep on error
setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode
unsetopt FLOW_CONTROL     # Disable start/stop characters

# Completion Settings
zstyle ':completion:*' menu select                 # Enable menu selection
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''              # Group matches
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'

# Fix prompt redraw issues
export PROMPT_EOL_MARK=''   # Remove % at partial lines
ZLE_RPROMPT_INDENT=0       # Remove extra space in right prompt

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

# Fix for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Hooks
eval "$(devbox completion zsh)"
eval "$(zoxide init zsh)"

# Ensure proper key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
