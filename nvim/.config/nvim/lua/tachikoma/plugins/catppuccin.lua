return {
  "catppuccin/nvim",
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup {
      flavour = "macchiato",
      integrations = {
        cmp = true,
        gitsigns = true,
        barbar = true,
        diffview = true,
        mason = true,
        lsp_trouble = true,
        dadbod_ui = true,
        treesitter = true,
        notify = true,
      },
    }

    vim.cmd.colorscheme "catppuccin"
  end
}

