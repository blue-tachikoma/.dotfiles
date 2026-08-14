return {
  "scalameta/nvim-metals",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    if vim.fn.executable("cs") == 0 and vim.fn.executable("coursier") == 0 then
      vim.notify("Metals requires Coursier. Install it before opening Scala, SBT, or Java files.", vim.log.levels.WARN)
    end

    local metals = require("metals")
    local metals_config = metals.bare_config()

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

    metals_config.settings = {
      serverVersion = "1.6.8",
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

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
  keys = {
    {
      "<leader>fm",
      function() require("metals").commands() end,
      desc = "Metals commands picker",
    },
    {
      "K",
      function() require("metals").type_of_range() end,
      mode = "v",
      desc = "Metals type of range",
    },
  },
}
