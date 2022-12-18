local status_ok, dap_ui = pcall(require, "dapui")
if not status_ok then
  return
end

func = require("tachikoma.functions")
require("dapui").setup()

func.map("n", "<leader>dp", [[<cmd>lua require"dapui".toggle()<CR>]])
