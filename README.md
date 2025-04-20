# dotfiles

Dev environment setup. Uses Nix for packages and ZSH as the shell, with tooling for Python and shell utilities for development.

## What's included

- Nix for package management (neovim, git, etc)
- CLI tools (bat, eza, fzf, ripgrep)
- ZSH with Antidote for plugin management
- UV for Python package management
- Starship for a clean prompt
- Tuckr for dotfile management


## Quick start

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./install.sh
```

## Structure

```
Configs/
├── zsh/              # ZSH config
│   └── conf.d/       # Modular configs (git, python, etc)
└── starship/         # Prompt settings
```

## Customizing

- Add plugins: `Configs/zsh/.config/zsh/.zsh_plugins.txt`
- Add functions: `Configs/zsh/.config/zsh/conf.d/`
- Change prompt: `Configs/starship/.config/starship.toml`

## Updating

```bash
cd ~/.config/dotfiles
git pull
./install.sh
```
