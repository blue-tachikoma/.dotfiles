return {
  "rmagatti/auto-session",
  config = function ()
    local auto_session = require("auto-session")
    auto_session.setup {
      log_level = "error",
      pre_save_cmds = {"Neotree close"},
      post_save_cmds = {"Neotree reveal"},
      post_restore_cmds = {"Neotree reveal"},
      cwd_change_handling = {
        -- refresh lualine so the new session name is displayed in the status bar
        post_cwd_changed_hook = function()
          require("lualine").refresh()
        end,
      },
    }
  end,
}
