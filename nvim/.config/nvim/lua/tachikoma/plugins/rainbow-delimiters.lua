return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    local rainbow_delimiters_setup = require("rainbow-delimiters.setup")

    rainbow_delimiters_setup {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks'
      }
    }
  end
}
