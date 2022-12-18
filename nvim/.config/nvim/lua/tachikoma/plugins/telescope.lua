local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

func = require("tachikoma.functions")

telescope.setup()

func.map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files()<CR>]])
func.map("n", "<leader>fg", [[<cmd>lua require"telescope.builtin".live_grep()<CR>]])
func.map("n", "<leader>fb", [[<cmd>lua require"telescope.builtin".buffers()<CR>]])
func.map("n", "<leader>fh", [[<cmd>lua require"telescope.builtin".help_tags()<CR>]])
