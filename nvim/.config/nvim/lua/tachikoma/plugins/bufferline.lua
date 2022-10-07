local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  animation = true,
  tabpages = true,
  clickable = true,
  icons = true,
  maximum_padding = 1,
  maximum_length = 30,
  icon_custom_colors = false
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')
local nvim_tree_view = require('nvim-tree.view')

local function get_tree_size()
  return nvim_tree_view.View.width 
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
