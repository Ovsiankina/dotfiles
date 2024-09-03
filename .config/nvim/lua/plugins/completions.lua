return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- LOGICAL symboles
        luasnip.add_snippets('all', {
          luasnip.parser.parse_snippet("implies", "⇒"),
          luasnip.parser.parse_snippet("iff", "⇔"),
          luasnip.parser.parse_snippet("neg", "¬"),
          luasnip.parser.parse_snippet("land", "∧"),
          luasnip.parser.parse_snippet("lor", "∨"),
          luasnip.parser.parse_snippet("oplus", "⊕"),
          luasnip.parser.parse_snippet("top", "⊤"),
          luasnip.parser.parse_snippet("bot", "⊥"),
          luasnip.parser.parse_snippet("forall", "∀"),
          luasnip.parser.parse_snippet("exists", "∃"),
          luasnip.parser.parse_snippet("exists!", "∃!"),
          luasnip.parser.parse_snippet("vdash", "⊢"),
          luasnip.parser.parse_snippet("models", "⊨"),
          luasnip.parser.parse_snippet("nvdash", "⊬"),
          luasnip.parser.parse_snippet("nmodels", "⊭"),
          luasnip.parser.parse_snippet("box", "□"),
          luasnip.parser.parse_snippet("diamond", "◇"),
          luasnip.parser.parse_snippet("therefore", "∴"),
          luasnip.parser.parse_snippet("because", "∵"),
          luasnip.parser.parse_snippet("nand", "⊼"),
          luasnip.parser.parse_snippet("nor", "⊽"),
          luasnip.parser.parse_snippet("odot", "⊙"),
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, item)
            local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
            item = require("lspkind").cmp_format({
              -- any lspkind format settings here
            })(entry, item)
            if color_item.abbr_hl_group then
              item.kind_hl_group = color_item.abbr_hl_group
              item.kind = color_item.abbr
            end
            return item
          end,
        },

        --          ╭─────────────────────────────────────────────────────────╮
        --          │                          Remap                          │
        --          ╰─────────────────────────────────────────────────────────╯
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-[>"] = cmp.mapping.scroll_docs(-4),
          ["<C-]>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
      })
    end,
  },
}
