local status_ok, treesitter_install = pcall(require, "nvim-treesitter.install")
if not status_ok then
  return
end

treesitter_install.update({ with_sync = true })

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_insatlled = { 
	"scala", 
	"lua", 
	"java", 
	"bash", 
	"hocon", 
	"json", 
	"javascript", 
	"typescript", 
	"html", 
	"css", 
	"scss", 
	"python", 
	"sql", 
	"yaml", 
	"proto", 
	"markdown", 
	"dockerfile"
  },
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true, disable = {""} }
}
