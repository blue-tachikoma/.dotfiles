# Dotfiles

**Table of Contents**

<!-- toc -->

* [Tools](#tools)
    * [General](#general)
    * [Tmux plugins](#tmux-plugins)
    * [Nvim plugins](#nvim-plugins)
    * [Oh my zsh plugins](#oh-my-zsh-plugins)
* [Installation](#intallation)
    * [Stow dotfiles](#stow-dotfiles)

<!-- tocstop -->

## Tools

### General

- [kitty](https://sw.kovidgoyal.net/kitty/) with [onenord](https://github.com/rmehri01/onenord.nvim/tree/main/extras/kitty) theme
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://www.zsh.org/)
- [oh-my-szh](https://ohmyz.sh/) with [robbyrussel](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell) theme
- [nvim](https://neovim.io/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [htop](https://htop.dev/)
- [sdkman](https://sdkman.io/)

### Tmux plugins

- [tpm](https://github.com/tmux-plugins/tpm)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)

### Nvim plugins

- [packer](https://github.com/wbthomason/packer.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-metals](https://github.com/scalameta/nvim-metals)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [barbar](https://github.com/romgrk/barbar.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [trouble](https://github.com/folke/trouble.nvim)
- [auto-session](https://github.com/rmagatti/auto-session)
- [lazygit](https://github.com/kdheepak/lazygit.nvim)
- [comment](https://github.com/numToStr/Comment.nvim)
- [onenord](https://github.com/rmehri01/onenord.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [dashboard](https://github.com/glepnir/dashboard-nvim)
- [glow](https://github.com/ellisonleao/glow.nvim)

### Oh My Zsh plugins

- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker)
- [docker-compose](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose)
- [dnf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf)
- [npm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm)
- [sbt](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sbt)
- [scala](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/scala)
- [sdk](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sdk)
- [sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)

## Intallation

### Stow dotfiles

#### Install GNU Stow

```console
$ sudo dnf install stow
```
#### Clone project to home directory

```console
$ git clone https://github.com/blue-tachikoma/.dotfiles.git
```

#### Create symlinks 

```console
$ cd .dotfiles/
$ stow -vt ~ *
```
