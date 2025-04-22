# eval

[[ -f "$ZSH_COMPLETIONS/_gh" ]] || eval "$(gh completion -s zsh > "$ZSH_COMPLETIONS/_gh")"


eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
