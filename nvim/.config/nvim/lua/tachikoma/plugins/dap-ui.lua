local status_ok, dap_ui = pcall(require, "dapui")
if not status_ok then
  return
end

require("dapui").setup()
