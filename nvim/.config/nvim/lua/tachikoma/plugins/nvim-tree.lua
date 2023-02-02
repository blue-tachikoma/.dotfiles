local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local api_status_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
if not api_status_ok then
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

local function open_nvim_tree()
  nvim_tree_api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

func.map('n', '<F5>', '<Cmd>NvimTreeRefresh<CR>')
func.map('n', '<F4>', '<Cmd>NvimTreeToggle<CR>')
