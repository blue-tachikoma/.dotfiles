local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

func = require("tachikoma.functions")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      args = { "server", "-f" }, -- here just as an example
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

func.map("n", "<leader>ds", [[<cmd>lua require"dap".continue()<CR>]])
func.map("n", "<leader>dd", [[<cmd>lua require"dap".disconnect()<CR>]])
func.map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
func.map("n", "<leader>db", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
func.map("n", "<leader>di", [[<cmd>lua require"dap".step_into()<CR>]])
