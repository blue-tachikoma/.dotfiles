return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  lazy = false,
  config = function()
    local cmp = require("cmp")
    cmp.setup {
      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
      },
      snippet = {
        expand = function(args)
          -- Comes from vsnip
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sorting = {
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
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert {
        -- None of this made sense to me when first looking into this since there
        -- is no vim docs, but you can't have select = true here _unless_ you are
        -- also using the snippet stuff. So keep in mind that if you remove
        -- snippets you need to remove this select
        ["<CR>"] = cmp.mapping.confirm { select = true },
        -- I use tabs... some say you should stick to ins-completion but this is just here as an example
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
      },
    }
  end
}
