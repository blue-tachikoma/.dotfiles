local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

local func = require("tachikoma.functions.general")

-- Remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- Icons for diagnostic errors
vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "", texthl = "DiagnosticSignHint" })

neo_tree.setup {
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = true,
      }
    }
  },
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        -- "node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        -- "*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        ".DS_Store",
        ".idea",
        ".bsp",
        ".bloop",
        "metals.sbt"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    }
  }
}

func.map('n', '<F4>', '<Cmd>Neotree toggle<CR>')
func.map('n', '<F5>', '<Cmd>Neotree<CR>')
