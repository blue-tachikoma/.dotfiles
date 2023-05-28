local fn = vim.fn
local tsFunc = require("tachikoma.functions.treesitter")

-- Set neo-tree highlighting group before plugin init
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg="#c8d0e0", bg="#2e3440" })

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

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
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

  -- Theme
  use { "rmehri01/onenord.nvim" }

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

  -- DB
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }

  -- Syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = tsFunc.tsupdate() }

  -- Visual
  -- use { "kyazdani42/nvim-tree.lua" }
  use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { "MunifTanjim/nui.nvim", } }
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
  use { "nvim-telescope/telescope.nvim", tag = "0.1.1" }
  use { "akinsho/toggleterm.nvim", tag = "*" }
  use { "rmagatti/auto-session" }
  use { "ellisonleao/glow.nvim" }
  use { "rcarriga/nvim-notify" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
