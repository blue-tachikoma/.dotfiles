local function tsupdate()
  local status_ok, treesitter_install = pcall(require, "nvim-treesitter.install")
  if not status_ok then
    return
  end

  treesitter_install.update({ with_sync = true })
end

return {
  tsupdate = tsupdate
}
