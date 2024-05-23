local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

telescope.setup()

func.map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files()<CR>]])
func.map("n", "<leader>fg", [[<cmd>lua require"telescope.builtin".live_grep()<CR>]])
func.map("n", "<leader>fb", [[<cmd>lua require"telescope.builtin".buffers()<CR>]])
func.map("n", "<leader>fh", [[<cmd>lua require"telescope.builtin".help_tags()<CR>]])
func.map("n", "<leader>fd",
  [[<cmd>lua require"telescope.builtin".find_files({ search_dirs = { vim.fn.getcwd() .. '/.metals/readonly/dependencies'} })<CR>]])
func.map("n", "<leader>fj",
  [[<cmd>lua require"telescope.builtin".live_grep({ search_dirs = { vim.fn.getcwd() .. '/.metals/readonly/dependencies'} })<CR>]])

-- Extensions mappings
func.map("n", "<leader>fm", [[<cmd>lua require"telescope".extensions.metals.commands()<CR>]])
func.map("n", "<leader>fn", [[<cmd>lua require"telescope".extensions.notify.notify()<CR>]])
