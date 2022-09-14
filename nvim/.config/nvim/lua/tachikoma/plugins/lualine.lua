local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local local_onenord = require('lualine.themes.onenord')
lualine.setup {
	options = {
		theme = local_onenord,
    disabled_filetypes = { "NvimTree" }
	},
	sections = {lualine_c = {require('auto-session-library').current_session_name}}
}
