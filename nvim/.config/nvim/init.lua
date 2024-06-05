require "tachikoma.options"
require "tachikoma.keymaps"

local fn = vim.fn

-- Set neo-tree highlighting group before plugin init
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg="#c8d0e0", bg="#2e3440" })
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { fg="#c8d0e0", bg="#2e3440" })

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
lazy.setup {
  spec = {
    { import = "tachikoma.plugins" }
  }
}
