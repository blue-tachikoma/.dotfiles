# Dotfiles

Personal desktop and development-environment configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Included

| Package | Configuration |
| --- | --- |
| `btop` | System monitor with the Catppuccin Macchiato theme |
| `kitty` | Terminal emulator with the Catppuccin Macchiato theme |
| `nvim` | Neovim configuration powered by [lazy.nvim](https://github.com/folke/lazy.nvim) |
| `tmux` | Terminal multiplexer with TPM, Catppuccin, and resurrect |
| `zsh` | Zsh with Oh My Zsh, NVM, Coursier, SDKMAN, and OpenCode |

## Install

Install GNU Stow on Fedora:

```console
sudo dnf install stow
```

Clone the repository, then stow every package into your home directory:

```console
git clone https://github.com/blue-tachikoma/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -vt ~ */
```

To install only one package, pass its directory name instead:

```console
stow -vt ~ nvim
```

Remove a deployed package with:

```console
stow -D <package>
```

## First Run

- Start Neovim once to bootstrap `lazy.nvim` and install its plugins. Plugin revisions are pinned in `nvim/.config/nvim/lazy-lock.json`.
- Install [Coursier](https://get-coursier.io/) before opening Scala, SBT, or Java files in Neovim so Metals can install and start.
- Install tmux plugins with `prefix + I` after TPM is installed. The configured prefix is `Ctrl-a`.
- Install Oh My Zsh before loading the Zsh configuration.
