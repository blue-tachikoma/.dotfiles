return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
    }
  end,
  dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      "catppuccin/nvim",
  },
}
