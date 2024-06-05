return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "diff",
          "dockerfile",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "hocon",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "proto",
          "scala",
          "scss",
          "sql",
          "toml",
          "typescript",
          "vim",
          "vue",
          "yaml"
        },
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true
        },
        indent = { enable = true, disable = {""} }
      })
  end,
}
