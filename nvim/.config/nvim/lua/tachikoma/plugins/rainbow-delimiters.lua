

return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    local rainbow_delimiters_setup = require("rainbow-delimiters.setup")
    local onenord_colors = require("onenord.colors")
    local colors = onenord_colors.load()

    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg=colors.blue })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg=colors.red })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg=colors.yellow })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg=colors.green })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg=colors.orange })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg=colors.light_purple })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg=colors.cyan })

    rainbow_delimiters_setup {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks'
      },
      highlight = {
        'RainbowDelimiterBlue',
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterOrange',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end
}
