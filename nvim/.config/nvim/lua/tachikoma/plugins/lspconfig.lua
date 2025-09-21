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
    vim.lsp.config('lua_ls', {
      capabilities = lsp_capabilities
    })
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('bash_ls')
  end,
}
