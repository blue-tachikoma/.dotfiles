return {
  "nvim-lualine/lualine.nvim",
  config = function ()
    local lualine = require("lualine")
    local local_onenord = require('lualine.themes.onenord')
    lualine.setup {
      options = {
        theme = local_onenord,
      }
    }
  end,
}
