local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

bufferline.setup {
  options = {
    tab_size = 12,
    max_name_length = 30,
    mode = "buffers",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    },
    separator_style = "padded_slant",
  }
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')
local nvim_tree_view = require('nvim-tree.view')

local function get_tree_size()
  return nvim_tree_view.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

-- Move to previous/next
func.map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
func.map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
func.map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
func.map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
func.map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
func.map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
func.map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
func.map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
func.map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
func.map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
func.map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
func.map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
func.map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
func.map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
func.map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
func.map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- Magic buffer-picking mode
func.map('n', '<C-p>', '<Cmd>BufferPick<CR>')
-- Sort automatically by...
func.map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
func.map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>')
func.map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>')
func.map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>')
