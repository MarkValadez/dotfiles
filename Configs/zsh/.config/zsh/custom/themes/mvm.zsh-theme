# Color shortcuts
RED="$fg[red]"
GREEN="$fg[green]"
CYAN="$fg[cyan]"
YELLOW="$fg[yellow]"
MAGENTA="$fg[magenta]"
ORANGE='\e[38;5;208m]'
PURPLE="$fg[purple]"
RESET_COLOR=$reset_color

# Environment info function
function env_info() {
    local env_info=""
    # Check for Devbox
    if [[ -n $DEVBOX_SHELL_ENABLED ]]; then
        env_info+="%{$MAGENTA%}(devbox)%{$RESET_COLOR%}"
    fi
    # Check for Python venv
    if [[ -n $VIRTUAL_ENV ]]; then
        env_info+="%{$PURPLE%}($(basename $VIRTUAL_ENV))%{$RESET_COLOR%}"
    fi
    echo $env_info
}

PROMPT='$(env_info)%{$RED%}[%n]%{$GREEN%}[%(5~|%-1~/…/%3~|%4~)]$(git_prompt_info)%{$RESET_COLOR%}:'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$CYAN%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$CYAN%}›"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Symbols: ➤ ⍉ ✗ ✘ ✚ ✹ ✖ ➜ ═ ✭ ↵ ◒ ● § ⚑ ✔ ❮ ❯ ❮❮ ❯❯ ‹› « » ? ☁ ▴ └─ ┌─ |
RPROMPT='$(git_prompt_status)'
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}✔%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}⚑%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}§%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$YELLOW%}?%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}⍉%{$RESET_COLOR%}"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$CYAN%}↵%{$RESET_COLOR%}"