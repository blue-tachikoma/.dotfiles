local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

diffview.setup()

func.map("n", "<F2>", [[<cmd>DiffviewOpen<CR>]])
func.map("n", "<F3>", [[<cmd>DiffviewClose<CR>]])
