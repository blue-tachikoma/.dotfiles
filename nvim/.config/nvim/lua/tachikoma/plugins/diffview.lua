local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

func = require("tachikoma.functions")

diffview.setup()

func.map("n", "<F2>", [[<cmd>DiffviewOpen<CR>]])
func.map("n", "<F3>", [[<cmd>DiffviewClose<CR>]])
