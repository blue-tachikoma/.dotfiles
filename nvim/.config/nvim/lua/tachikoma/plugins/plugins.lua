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

-- Autocommand that reloads neovim whenever you save the plugins/plugins.lua file
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

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin manager
  use { "wbthomason/packer.nvim" }

  -- General
  use { "nvim-lua/plenary.nvim" }
  use { "kyazdani42/nvim-web-devicons" }

  -- Completion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-vsnip" }
  use { "hrsh7th/vim-vsnip" }

  -- LSP
  use { "scalameta/nvim-metals" } -- Scala
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }
	use { "glepnir/lspsaga.nvim", branch = "main" }
	use { "folke/trouble.nvim" }

  -- Debug
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }

  -- Theme
  use { "rmehri01/onenord.nvim" }

  -- Syntax highlighting
  use { "nvim-treesitter/nvim-treesitter" }

  -- Visual
  use { "kyazdani42/nvim-tree.lua" }
  use { "nvim-lualine/lualine.nvim" }
  use { "romgrk/barbar.nvim" }
  use { "glepnir/dashboard-nvim" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }
	use { "kdheepak/lazygit.nvim" }
  use { "sindrets/diffview.nvim" }

  -- Edit related
  use { "lukas-reineke/indent-blankline.nvim" }
	use { "numToStr/Comment.nvim" }
  use { "windwp/nvim-autopairs" }

  -- Misc
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }
	use { "akinsho/toggleterm.nvim", tag = "*" }
	use { "rmagatti/auto-session" }
	use { "ellisonleao/glow.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

