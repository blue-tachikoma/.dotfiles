# Repository Guide

## Stow Packages

- Each top-level directory is a GNU Stow package that deploys its contents into `$HOME`; install all packages with `stow -vt ~ */` or one with `stow -vt ~ <package>`.
- Remove a deployed package before deleting it from the repository: `stow -D <package>`.

## Configuration Entry Points

- Neovim starts at `nvim/.config/nvim/init.lua` and imports plugin specs from `nvim/.config/nvim/lua/tachikoma/plugins/`; keep plugin revisions in `nvim/.config/nvim/lazy-lock.json` aligned with plugin changes.
- Tmux reloads its deployed configuration from `~/.tmux.conf` with `Ctrl-a r`; keep TPM's `run` line last.
- Zsh loads Oh My Zsh from `$HOME/.oh-my-zsh`; `zsh-syntax-highlighting` must remain the final plugin.

## Verification

- This repository has no build, lint, or test automation. For Zsh changes, run `zsh -n zsh/.zshrc`; for tmux changes, parse the file with `tmux -f tmux/.tmux.conf start-server \; show-options -g`.
