local parsers = {
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
  "typespec",
  "vim",
  "vue",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter").install(parsers)
  end,
  branch = 'main',
  lazy = false,
  config = function ()
    require('nvim-treesitter').setup()

  end,
}
