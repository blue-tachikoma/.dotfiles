local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
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
  sync_install = false,
  highlight = {
    enable = true
  },
  indent = { enable = true, disable = {""} }
}
