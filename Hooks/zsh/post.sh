#!/bin/bash

# Set as locin shell
zsh_path=$(command -v zsh)
if ! grep -Fxq "$zsh_path" /etc/shells; then
    echo "$zsh_path" | sudo tee -a /etc/shells
fi
