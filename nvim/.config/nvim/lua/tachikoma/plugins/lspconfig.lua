return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason")
    require("mason-lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require("lspconfig").lua_ls.setup {
      capabilities = lsp_capabilities
    }
    require("lspconfig").ts_ls.setup {}
    require("lspconfig").bashls.setup {}
  end,
}
