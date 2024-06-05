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
func.map("n", "<leader>h", [[<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), nil)<CR>]])
func.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>")
func.map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
func.map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
func.map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
func.map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only

-- Telescope
func.map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files()<CR>]])
func.map("n", "<leader>fg", [[<cmd>lua require"telescope.builtin".live_grep()<CR>]])
func.map("n", "<leader>fb", [[<cmd>lua require"telescope.builtin".buffers()<CR>]])
func.map("n", "<leader>fh", [[<cmd>lua require"telescope.builtin".help_tags()<CR>]])
func.map("n", "<leader>fd",
  [[<cmd>lua require"telescope.builtin".find_files({ search_dirs = { vim.fn.getcwd() .. '/.metals/readonly/dependencies'} })<CR>]])
func.map("n", "<leader>fj",
  [[<cmd>lua require"telescope.builtin".live_grep({ search_dirs = { vim.fn.getcwd() .. '/.metals/readonly/dependencies'} })<CR>]])
func.map("n", "<leader>fm", [[<cmd>lua require"telescope".extensions.metals.commands()<CR>]])
func.map("n", "<leader>fn", [[<cmd>lua require"telescope".extensions.notify.notify()<CR>]])

-- Lspsaga
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

-- Dapui
func.map("n", "<leader>dp", [[<cmd>lua require"dapui".toggle()<CR>]])

-- Dap
func.map("n", "<leader>ds", [[<cmd>lua require"dap".continue()<CR>]])
func.map("n", "<leader>dd", [[<cmd>lua require"dap".disconnect()<CR>]])
func.map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
func.map("n", "<leader>db", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
func.map("n", "<leader>di", [[<cmd>lua require"dap".step_into()<CR>]])

-- Diffview
func.map("n", "<F2>", [[<cmd>DiffviewOpen<CR>]])
func.map("n", "<F3>", [[<cmd>DiffviewClose<CR>]])

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

-- Lsp
func.map("v", "K", '<Esc><cmd>lua require"metals".type_of_range()<CR>')

-- Visual Block --
-- Move text up and down
func.map("x", "<A-j>", ":move '>+1<CR>gv-gv")
func.map("x", "<A-k>", ":move '<-2<CR>gv-gv")

