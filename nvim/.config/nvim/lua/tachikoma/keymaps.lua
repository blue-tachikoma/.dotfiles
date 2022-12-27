local func = require("tachikoma.functions.general")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
func.map("n", "<C-h>", "<C-w>h")
func.map("n", "<C-j>", "<C-w>j")
func.map("n", "<C-k>", "<C-w>k")
func.map("n", "<C-l>", "<C-w>l")

-- Move line up and down
func.map("n", "<A-j>", ":m .+1<CR>")
func.map("n", "<A-k>", ":m .-2<CR>")

-- Resize with arrows
func.map("n", "<C-Up>", ":resize +2<CR>")
func.map("n", "<C-Down>", ":resize -2<CR>")
func.map("n", "<C-Left>", ":vertical resize -2<CR>")
func.map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Lsp
func.map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
func.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
func.map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
func.map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
func.map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
func.map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
func.map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
func.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>")
func.map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
func.map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
func.map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
func.map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only

-- Lazygit
func.map('n', '<leader>gg', '<Cmd>LazyGit<CR>')

-- Dadbod
func.map('n', '<leader>du', '<cmd>DBUIToggle<CR>')

-- Insert --
-- Press jk fast to enter
func.map("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
func.map("v", "<", "<gv")
func.map("v", ">", ">gv")

-- Move text up and down
func.map("v", "<A-j>", ":m .+1<CR>==")
func.map("v", "<A-k>", ":m .-2<CR>==")

-- Hold on to clipboard value
func.map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
func.map("x", "J", ":move '>+1<CR>gv-gv")
func.map("x", "K", ":move '<-2<CR>gv-gv")
func.map("x", "<A-j>", ":move '>+1<CR>gv-gv")
func.map("x", "<A-k>", ":move '<-2<CR>gv-gv")

