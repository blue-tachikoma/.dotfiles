local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

func = require("tachikoma.functions")

nvim_tree.setup {
  view = {
    adaptive_size = true
  },
  git = {
    ignore = false
  }
}

func.map('n', '<F5>', '<Cmd>NvimTreeRefresh<CR>')
func.map('n', '<F4>', '<Cmd>NvimTreeToggle<CR>')
