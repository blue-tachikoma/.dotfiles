local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

bufferline.setup {
  options = {
    mode = 'buffers', -- tabs
    offsets = {
      {
        text = 'EXPLORER',
        filetype = 'neo-tree',
        highlight = 'PanelHeading',
        text_align = 'left',
        separator = true,
      },
      {
        text = ' PACKER',
        filetype = 'packer',
        highlight = 'PanelHeading',
        separator = true,
      },
      {
        text = ' DATABASE VIEWER',
        filetype = 'dbui',
        highlight = 'PanelHeading',
        separator = true,
      },
      {
        text = ' DIFF VIEW',
        filetype = 'DiffviewFiles',
        highlight = 'PanelHeading',
        separator = true,
      },
    },
  }
}

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
