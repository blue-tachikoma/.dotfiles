local status_ok, dap_ui = pcall(require, "dapui")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")
dap_ui.setup()

func.map("n", "<leader>dp", [[<cmd>lua require"dapui".toggle()<CR>]])
