return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "L3MON4D3/LuaSnip",
	    event = "VeryLazy",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            local highlight_colors = require("nvim-highlight-colors")

            -- Add logical symbol snippets
            luasnip.add_snippets("all", {
                luasnip.parser.parse_snippet("/implies", "⇒"),
                -- Add other logical symbols here...
            })

            -- Set up nvim-cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = function(entry, vim_item)
                        -- Apply nvim-highlight-colors formatting first
                        local color_item = highlight_colors.format(entry, vim_item)

                        -- Use lspkind for additional formatting
                        vim_item = lspkind.cmp_format({
                            mode = "symbol_text", -- Show both symbol and text
                            maxwidth = 50, -- Prevent popup from getting too wide
                            ellipsis_char = "...", -- Show ellipsis for truncated items
                        })(entry, color_item)

                        return vim_item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-[>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-]>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
            })
        end,
    },
}

