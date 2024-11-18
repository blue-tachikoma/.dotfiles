return {
  'williamboman/mason-lspconfig',
  dependencies = { "mason.nvim" },
  config = function ()
    require("mason")
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "bashls", "ts_ls" }
    }
  end,
}
