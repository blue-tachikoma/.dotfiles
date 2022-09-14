local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  return
end

local expand = vim.fn.expand
dashboard.custom_center = {
	{
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'
  }
}
