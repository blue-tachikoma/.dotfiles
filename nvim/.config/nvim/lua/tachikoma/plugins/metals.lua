return {
  "scalameta/nvim-metals",
  dependencies = {
    "mfussenegger/nvim-dap"
  },
  config = function()
    local metals = require("metals")

    local function metals_status_handler(err, status, ctx)
      local val = {}
      -- trim and remove spinner
      local text = status.text:gsub("[⠇⠋⠙⠸⠴⠦]", ""):gsub("^%s*(.-)%s*$", "%1")
      if status.hide then
        val = { kind = "end" }
      elseif status.show then
        val = { kind = "begin", title = text }
      elseif status.text then
        val = { kind = "report", message = text }
      else
        return
      end
      local msg = { token = "metals", value = val }
      vim.lsp.handlers["$/progress"](err, msg, ctx)
    end

    local metals_config = metals.bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true
    }

    metals_config.init_options.statusBarProvider = "on"
    metals_config.handlers = { ["metals/status"] = metals_status_handler }
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      metals.setup_dap()
    end

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
