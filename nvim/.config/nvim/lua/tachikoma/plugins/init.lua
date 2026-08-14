return {
  -- General
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- Edit related
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
  { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

  -- Misc
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
