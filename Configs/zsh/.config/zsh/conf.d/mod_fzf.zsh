# fzf

# --- aliases
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# --- functions
# * fuzzy find and copy path to clipboard
function ff() {
    fp | pbcopy
}

# Enhanced FZF configuration
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
  --height 40% 
  --layout=reverse 
  --border 
  --info=inline
  --preview-window=right:60%
  --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# History search with FZF
function fzf-history() {
    local selected=$(history | fzf --tac | awk '{$1=""; print substr($0,2)}')
    BUFFER=$selected
    zle end-of-line
}
zle -N fzf-history
bindkey '^R' fzf-history
