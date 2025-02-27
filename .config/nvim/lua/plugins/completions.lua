return {
    -- TODO: add back logical symbols custom snippets
    --  FIX: luasnip broken with blink.cmp
    -- {
    -- 	"L3MON4D3/LuaSnip",
    -- 	event = "VeryLazy",
    -- 	dependencies = {
    -- 		"saadparwaiz1/cmp_luasnip",
    -- 		"rafamadriz/friendly-snippets",
    -- 	},
    -- },
    {

        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",

        -- use a release tag to download pre-built binaries
        version = "*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",
                ["<Tab>"] = { "accept", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-J>"] = { "select_next", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            completion = {
                documentation = {
                    auto_show = true,
                },
                ghost_text = {
                    enabled = false,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
            },
            -- FIX: luasnip broken
            -- snippets = {
            -- 	preset = "luasnip",
            -- },
        },
        opts_extend = { "sources.default" },
    },
}
