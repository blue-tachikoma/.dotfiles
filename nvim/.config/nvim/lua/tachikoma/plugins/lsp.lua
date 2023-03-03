local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local lspconfig_util_status_ok, lspconfig_util = pcall(require, "lspconfig.util")
if not lspconfig_util_status_ok then
  return
end

mason.setup()
mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "volar" }
}

-- Lua
lspconfig.lua_ls.setup {}

-- Vue
lspconfig.volar.setup {
  root_dir = lspconfig_util.root_pattern 'package.json',
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    languageFeatures = {
      implementation = true,
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      workspaceSymbol = true,
      completion = {
        defaultTagNameCase = 'both',
        defaultAttrNameCase = 'kebabCase',
        getDocumentNameCasesRequest = false,
        getDocumentSelectionRequest = false,
      }
    }
  }
}
