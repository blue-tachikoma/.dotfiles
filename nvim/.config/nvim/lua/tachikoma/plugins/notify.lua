local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
  stages = "fade_in_slide_out",
  timeout = 3000
}

vim.notify = require("notify")
