return {
  "rcarriga/nvim-dap-ui",
  dependencies = "nvim-neotest/nvim-nio",
  opts = {
    expand_lines = false
  },
  keys = {
    { "<leader>dp", function() require("dapui").toggle({ reset = true }) end, desc = "Toggle DAP UI" },
  },
}
