return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  lazy = false,
  config = function(_, opts)
    local cmp = require("cmp")
    opts.sources = opts.sources or {
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }
    opts.snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    }
    opts.sorting = {
      comparators = {
        cmp.config.compare.exact,
        cmp.config.compare.offset,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.scopes,
        cmp.config.compare.locality,
        cmp.config.compare.length,
        cmp.config.compare.sort_text,
        cmp.config.compare.kind,
        cmp.config.compare.order,
      }
    }
    opts.preselect = cmp.PreselectMode.None
    opts.mapping = cmp.mapping.preset.insert {
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    }
    cmp.setup(opts)
  end
}
