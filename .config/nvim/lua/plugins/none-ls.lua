-- local null_ls_sources = {
-- 	"black", -- Python
-- 	"stylua", -- Lua
-- 	"latexindent", -- LaTeX
-- 	"gitsigns", -- git operations at cursor positions
-- }

return {
    -- null-ls configuration
    {
        -- Hook non-LSP sources to LSP client to for exemple expend code actions
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {

                    -- Code actions
                    null_ls.builtins.code_actions.xo,             -- JS (eslint wrapper)
                    null_ls.builtins.code_actions.gitsigns,       -- git operations
                    null_ls.builtins.code_actions.refactoringm,   -- go, js, python
                    null_ls.builtins.code_actions.ts_node_action, -- treesitter

                    -- Completions
                    null_ls.builtins.completion.luasnip,
                    null_ls.builtins.completion.spell,

                    -- Diagnostics
                    null_ls.builtins.diagnostics.actionlint,   -- GitHub actions workglow
                    null_ls.builtins.diagnostics.checkmake,    -- Make file
                    null_ls.builtins.diagnostics.chktex,       --LaTeX
                    null_ls.builtins.diagnostics.clang_check,  -- c, cpp
                    null_ls.builtins.diagnostics.cppcheck,     -- static c/cpp analysis
                    null_ls.builtins.diagnostics.cpplint,      -- cpp google style
                    null_ls.builtins.diagnostics.djlint,       -- Django
                    null_ls.builtins.diagnostics.hadolint,     -- Dockerfile
                    null_ls.builtins.diagnostics.luacheck,     -- Lua
                    null_ls.builtins.diagnostics.markdownlint, -- Markdown

                    -- Formating
                    null_ls.builtins.formatting.black,   -- Python
                    null_ls.builtins.formatting.stylua,  -- Lua
                    null_ls.builtins.formatting.rustfmt, --rust
                },

                -- Exemple on how to config a source (C_A.gitsigns here)
                -- Goal: filter out blame actions
                --
                -- local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
                --     config = {
                --         filter_actions = function(title)
                --
                --             return title:lower():match("blame") == nil
                --         end,
                --     },
                -- })
                debug = true,
            })
        end,

        --          ╭─────────────────────────────────────────────────────────╮
        --          │                          Remap                          │
        --          ╰─────────────────────────────────────────────────────────╯
        keys = {
            { "fc", vim.lsp.buf.format, mode = "n", desc = "Format code" },
        },
    },

    -- Mason-null-ls configuration
    -- {
    --     "jay-babu/mason-null-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "nvimtools/none-ls.nvim",
    --     },
    --     opts = {
    --         -- ensure_installed = null_ls_sources,
    --         automatic_installation = true,
    --     },
    -- },
}
