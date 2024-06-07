return {
  -- General
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- LSP
  { "folke/trouble.nvim", cmd = "Trouble" },
  { "j-hui/fidget.nvim", version = "v1.4.5", config = true },

  -- Debug
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

  -- DB
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',

  -- Git
  "kdheepak/lazygit.nvim",
  "sindrets/diffview.nvim",

  -- Edit related
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
  { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

  -- Misc
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
