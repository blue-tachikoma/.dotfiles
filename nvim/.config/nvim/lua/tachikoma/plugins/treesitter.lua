return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,
  config = function ()
    require('nvim-treesitter').setup()

    local ensure_installed = {
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
    }
    require('nvim-treesitter').install(ensure_installed)
  end,
}
