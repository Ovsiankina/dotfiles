local servers = {
    "ast_grep",                        -- Multi-language
    "clangd",                          -- C/C++
    "gopls",                           -- Go
    "html",                            -- HTML
    "lua_ls",                          -- Lua
    "marksman",                        -- Markdown
    "pyright",                         -- Python
    "rust_analyzer",                   -- Rust
    -- "sqlls",                           -- SQL
    -- "texlab",                          -- LaTeX
    "ts_ls",                           -- TypeScript
    -- "bashls",                          -- Bash
    "shellcheck",                      -- Bash
    "taplo",                           -- TOML
    -- "intelephense",                    -- PHP
    "lemminx",                         -- XML
    "docker_compose_language_service", -- Docker Compose
    "dockerls",                        -- Dockerfile
    "biome",                           -- JSON
}

return {
    {
        "williamboman/mason.nvim",
        opts = {},
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = servers,
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        lazy = false,
        keys = {
            { "K",         function() require("noice.lsp").hover() end, desc = "Definitions" },
            { "gd",        vim.lsp.buf.definitions,                     desc = "Go to definitions" },
            { "gr",        vim.lsp.buf.references,                      desc = "Go to reference" },
            { "<space>ca", vim.lsp.buf.code_action,                     desc = "Code action",         mode = { "n", "v" } },
            { "gi",        vim.lsp.buf.implementation,                  desc = "Go to implementation" },
        },
        config = function()

            -- NOTE: Java not always needed. Remember to enable the java plugin
            -- as well (bottom of this file)
            --
            -- require("java").setup()
            local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- lspconfig.jdtls.setup {}

            -- lspconfig.intelephense.setup({
            --     capabilities = capabilities,
            --     init_options = {
            --         licenceKey = vim.fn.expand("~/.intelephense/licence.txt"),
            --     },
            -- })

            local function get_python_path(workspace)
                if workspace == nil then
                    return vim.fn.exepath("python3") or vim.fn.exepath("python")
                end
                local venv_path = workspace .. "/.venv/bin/python"
                local venv_exists = vim.fn.glob(venv_path)
                if venv_exists ~= "" then
                    return venv_path
                end
                return vim.fn.exepath("python3") or vim.fn.exepath("python")
            end

            for _, server in ipairs(servers) do
                local config = {
                    capabilities = capabilities,
                }
                if server == "pyright" then
                    config.on_init = function(client)
                        local python_path = get_python_path(client.config.root_dir)
                        client.config.settings.python.pythonPath = python_path
                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                end
                lspconfig[server].setup(config)
            end
        end,
    },
    { "nvim-lua/lsp-status.nvim" },
    { "onsails/lspkind.nvim" },
}
