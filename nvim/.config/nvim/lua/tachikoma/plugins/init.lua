local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

require("tachikoma.plugins.auto-session")
require("tachikoma.plugins.bufferline")
require("tachikoma.plugins.cmp")
require("tachikoma.plugins.dap")
require("tachikoma.plugins.dashboard")
require("tachikoma.plugins.gitsigns")
require("tachikoma.plugins.indent-blankline")
require("tachikoma.plugins.lualine")
require("tachikoma.plugins.metals")
require("tachikoma.plugins.nvim-tree")
require("tachikoma.plugins.toggleterm")
require("tachikoma.plugins.treesitter")

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  })
  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })
	use { 
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = require('lspsaga').init_lsp_saga()
  }
  use { 'rmehri01/onenord.nvim', config = require("onenord").setup() }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = require("telescope").setup()
  }
  use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
  }
  use('glepnir/dashboard-nvim')
  use('lewis6991/gitsigns.nvim')
  use('lukas-reineke/indent-blankline.nvim')
	use('rmagatti/auto-session')
	use {
		'folke/trouble.nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
    config = require("trouble").setup()
	}
	use { 
    'ellisonleao/glow.nvim',
    config = require("glow").setup()
  }
	use('kdheepak/lazygit.nvim')
	use { 
    'numToStr/Comment.nvim',
    config = require("Comment").setup()
  }
	use { 
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = require("toggleterm").setup()
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

