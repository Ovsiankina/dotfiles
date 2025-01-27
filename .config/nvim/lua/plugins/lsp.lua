local servers = {
    "ast_grep", "clangd", "gopls", "html", "jdtls", "lua_ls", "marksman",
    "pyright", "rust_analyzer", "sqlls", "texlab", "ts_ls", "bashls",
    "taplo", "intelephense", "lemminx", "docker_compose_language_service",
    "dockerls"
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
            servers = {
                jdtls = {},
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        lazy = false,
        keys = {
            { "K",         vim.lsp.buf.hover,       desc = "Definitions" },
            { "gd",        vim.lsp.buf.definitions, desc = "Go to definitions" },
            { "gr",        vim.lsp.buf.references,  desc = "Go to reference" },
            { "<space>ca", vim.lsp.buf.code_action, desc = "Code action",      mode = { "n", "v" } },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            lspconfig.intelephense.setup({
                capabilities = capabilities,
                init_options = {
                    licenceKey = vim.fn.expand("~/.intelephense/licence.txt"),
                },
            })

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

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp" },
                callback = function()
                    vim.bo.shiftwidth = 4
                    vim.bo.tabstop = 4
                    vim.bo.softtabstop = 4
                    vim.bo.expandtab = true
                end,
            })
        end,
    },
    { "nvim-lua/lsp-status.nvim" },
    { "onsails/lspkind.nvim" },
}
