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
  use "wbthomason/packer.nvim"

  use { "hrsh7th/nvim-cmp", requires = { { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-vsnip" }, { "hrsh7th/vim-vsnip" } } }
  use { "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } }
	use { "glepnir/lspsaga.nvim", branch = "main" }
  use { "rmehri01/onenord.nvim" }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  use { "nvim-treesitter/nvim-treesitter" }
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }
  use { "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "glepnir/dashboard-nvim" }
  use { "lewis6991/gitsigns.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
	use { "rmagatti/auto-session" }
	use { "folke/trouble.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
	use { "ellisonleao/glow.nvim" }
	use { "kdheepak/lazygit.nvim" }
	use { "numToStr/Comment.nvim" }
	use { "akinsho/toggleterm.nvim", tag = "*" }
  use { "windwp/nvim-autopairs" }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

