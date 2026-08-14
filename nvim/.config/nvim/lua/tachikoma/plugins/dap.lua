return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>ds", function() require("dap").continue() end, desc = "Start or continue debugging" },
    { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect debugger" },
    { "<leader>dK", function() require("dap.ui.widgets").hover() end, desc = "Inspect under cursor" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
  },
  config = function ()
    local dap = require("dap")
    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
          -- args = { "server" }, -- here just as an example
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }
  end,
}
