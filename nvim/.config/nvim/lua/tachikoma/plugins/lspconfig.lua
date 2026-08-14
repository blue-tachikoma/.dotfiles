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
    vim.lsp.config('ts_ls', {
      capabilities = lsp_capabilities
    })
    vim.lsp.config('tsp_server', {
      capabilities = lsp_capabilities
    })
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('tsp_server')

    local group = vim.api.nvim_create_augroup("tachikoma-lsp-keymaps", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol, opts)
        vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>h", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
