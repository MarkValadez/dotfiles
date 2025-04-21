# coloring

# --- aliases

alias eza_params="--color=auto --group-directories-first"
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree -D $eza_params --level=4'
alias tree='eza --tree $eza_params --level=3'
