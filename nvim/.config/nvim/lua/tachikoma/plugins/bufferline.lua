local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

func = require("tachikoma.functions")

bufferline.setup {
  animation = true,
  tabpages = true,
  clickable = true,
  icons = true,
  maximum_padding = 1,
  maximum_length = 30,
  icon_custom_colors = false
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
func.map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
func.map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
func.map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
func.map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
func.map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
func.map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
func.map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
func.map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
func.map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
func.map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
func.map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
func.map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
func.map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
func.map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
func.map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
func.map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
func.map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
func.map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
func.map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
func.map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
func.map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
