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
  keys = {
    { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP finder" },
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
    { "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", mode = "v", desc = "Range code action" },
    { "gr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
    { "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
    { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line diagnostics" },
    { "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Cursor diagnostics" },
    { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
    { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
    { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Outline" },
    { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover documentation" },
  },
}
