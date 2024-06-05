return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  keys = {
    -- Move to previous/next
    { '<A-,>', '<Cmd>BufferPrevious<CR>', mode = "n", desc = "Previous buffer" },
    { '<A-.>', '<Cmd>BufferNext<CR>', mode = "n", desc = "Next buffer" },
    -- Re-order to previous/next
    { '<A-<>', '<Cmd>BufferMovePrevious<CR>', mode = "n", desc = "Move buffer to previous position" },
    { '<A->>', '<Cmd>BufferMoveNext<CR>', mode = "n", desc = "Move buffer to next position" },
    -- -- Pin/unpin buffer
    { '<A-p>', '<Cmd>BufferPin<CR>', mode = "n", desc = "Pin buffer" },
    -- -- Close buffer
    { '<A-c>', '<Cmd>BufferClose<CR>', mode = "n", desc = "Close buffer" },
    -- -- Magic buffer-picking mode
    { '<C-p>', '<Cmd>BufferPick<CR>', mode = "n", desc = "Pick buffer" },
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = true,
    sidebar_filetypes = {
      ['neo-tree'] = true,
    },
  }
}
