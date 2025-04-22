# eval

# [[ -f "$ZSH_COMPLETIONS/_gh" ]] || eval "$(gh completion -s zsh > "$ZSH_COMPLETIONS/_gh")"
# [[ -f "$ZSH_COMPLETIONS/_devbox" ]] || eval "$(devbox completion zsh > "$ZSH_COMPLETIONS/_devbox")"


eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
