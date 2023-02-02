local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup {
	log_level = "error",
  pre_save_cmds = {"NvimTreeClose"},
	cwd_change_handling = {
		-- refresh lualine so the new session name is displayed in the status bar
		post_cwd_changed_hook = function()
			require("lualine").refresh()
		end,
  },
}
