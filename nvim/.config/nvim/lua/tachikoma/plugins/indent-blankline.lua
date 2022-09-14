local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end


opt.listchars:append "eol:↴"

indent_blankline.setup {
	show_current_context = true,
	show_current_context_start = true,
	filetype_exclude = {'dashboard'}
}