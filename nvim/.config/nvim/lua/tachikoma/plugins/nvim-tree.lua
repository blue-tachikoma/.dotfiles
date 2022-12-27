local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

nvim_tree.setup {
  view = {
    adaptive_size = true
  },
  git = {
    ignore = false
  },
  filters = {
    custom = { ".bsp", ".bloop", ".metals", ".idea", ".ammonite", ".DS_Store" }
  }
}

func.map('n', '<F5>', '<Cmd>NvimTreeRefresh<CR>')
func.map('n', '<F4>', '<Cmd>NvimTreeToggle<CR>')
