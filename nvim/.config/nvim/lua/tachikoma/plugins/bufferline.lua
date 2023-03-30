local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

bufferline.setup {
  animation = true
}

local api_status_ok, bufferline_api = pcall(require, "bufferline.api")
if not api_status_ok then
  return
end

-- FileTree offset
vim.api.nvim_create_autocmd('FileType', {
  callback = function(tbl)
    local set_offset = bufferline_api.set_offset

    local bufwinid
    local last_width
    local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
      callback = function()
        bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

        local width = vim.api.nvim_win_get_width(bufwinid)
        if width ~= last_width then
          set_offset(width, 'FileTree')
          last_width = width
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufWipeout', {
      buffer = tbl.buf,
      callback = function()
        vim.api.nvim_del_autocmd(autocmd)
        set_offset(0)
      end,
      once = true,
    })
  end,
  pattern = 'neo-tree', -- or any other filetree's `ft`
})

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
