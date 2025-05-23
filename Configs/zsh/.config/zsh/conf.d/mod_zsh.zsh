# zsh

# --- aliases

alias zshrc="code $HOME/.config/zsh/.zshrc"


# Directory stack configuration
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index