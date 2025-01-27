return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = 'default',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-J>'] = { 'select_next', 'fallback' },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        completion = {
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = false
            }
        },
    },
    opts_extend = { "sources.default" }
}

-- return {
--     {
--         "hrsh7th/cmp-nvim-lsp",
--     },
--     {
--         "hrsh7th/cmp-buffer",
--     },
--     {
--         "L3MON4D3/LuaSnip",
-- 	    event = "VeryLazy",
--         dependencies = {
--             "saadparwaiz1/cmp_luasnip",
--             "rafamadriz/friendly-snippets",
--         },
--     },
--     {
--         "hrsh7th/nvim-cmp",
--         opts = function()
--             local cmp = require("cmp")
--             local luasnip = require("luasnip")
--             local lspkind = require("lspkind")
--             local highlight_colors = require("nvim-highlight-colors")
--
--             -- Add logical symbol snippets
--             luasnip.add_snippets("all", {
--                 luasnip.parser.parse_snippet("/implies", "⇒"),
--                 -- Add other logical symbols here...
--             })
--
--             -- Set up nvim-cmp
--             cmp.setup({
--                 snippet = {
--                     expand = function(args)
--                         luasnip.lsp_expand(args.body)
--                     end,
--                 },
--                 window = {
--                     completion = cmp.config.window.bordered({
--                         winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
--                     }),
--                     documentation = cmp.config.window.bordered({
--                         winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
--                     }),
--                 },
--                 sources = cmp.config.sources({
--                     { name = "nvim_lsp" },
--                     { name = "luasnip" },
--                 }, {
--                     { name = "buffer" },
--                 }),
--                 formatting = {
--                     format = function(entry, vim_item)
--                         -- Apply nvim-highlight-colors formatting first
--                         local color_item = highlight_colors.format(entry, vim_item)
--
--                         -- Use lspkind for additional formatting
--                         vim_item = lspkind.cmp_format({
--                             mode = "symbol_text", -- Show both symbol and text
--                             maxwidth = 50, -- Prevent popup from getting too wide
--                             ellipsis_char = "...", -- Show ellipsis for truncated items
--                         })(entry, color_item)
--
--                         return vim_item
--                     end,
--                 },
--                 mapping = cmp.mapping.preset.insert({
--                     ["<C-k>"] = cmp.mapping.select_prev_item(),
--                     ["<C-j>"] = cmp.mapping.select_next_item(),
--                     ["<C-[>"] = cmp.mapping.scroll_docs(-4),
--                     ["<C-]>"] = cmp.mapping.scroll_docs(4),
--                     ["<C-Space>"] = cmp.mapping.complete(),
--                     ["<C-e>"] = cmp.mapping.abort(),
--                     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                 }),
--             })
--         end,
--     },
-- }
--
