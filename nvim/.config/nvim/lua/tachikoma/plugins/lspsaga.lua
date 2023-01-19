local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

lspsaga.setup {
  symbol_in_winbar = {
    enable = false,
  }
}

func.map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
func.map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
func.map("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", { silent = true })
func.map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
func.map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
func.map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
func.map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
func.map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
func.map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
func.map("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
func.map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
