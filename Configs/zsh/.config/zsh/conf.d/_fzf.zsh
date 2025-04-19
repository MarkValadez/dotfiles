# fzf

# --- aliases

alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"


# --- functions

# * fuzzy find and copy path to clipboard
function ff() {
    fp | pbcopy
}