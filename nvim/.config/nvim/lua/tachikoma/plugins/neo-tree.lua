return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  keys = {
    { "<F4>", "<Cmd>Neotree toggle<CR>", mode = "n", desc = "NeoTree" },
    { "<F5>", "<Cmd>Neotree<CR>", mode = "n", desc = "NeoTree" }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
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

    require("neo-tree").setup {
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
      default_component_configs = {
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
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
  end
}
