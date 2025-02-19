local servers = {
<<<<<<< HEAD
	-- Multi-language
	ast_grep = {},

	-- C/C++
	clangd = {
		-- Recommended community flags for clangd (C/C++)
		cmd = {
			"clangd",
			"--background-index",
			"--fallback-style=llvm",
			"--header-insertion=never",
			"--cross-file-rename",
		},
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},

	-- Go
	gopls = {},

	-- HTML
	html = {},

	-- Lua
	lua_ls = {},

	-- Markdown
	marksman = {},

	-- Python
	pyright = {
		-- When initializing pyright, override the pythonPath based on a virtual environment
		on_init = function(client)
			local function get_python_path(workspace)
				if not workspace then
					return vim.fn.exepath("python3") or vim.fn.exepath("python")
				end
				local venv_path = workspace .. "/.venv/bin/python"
				if vim.fn.glob(venv_path) ~= "" then
					return venv_path
				end
				return vim.fn.exepath("python3") or vim.fn.exepath("python")
			end
			local python_path = get_python_path(client.config.root_dir)
			client.config.settings = client.config.settings or {}
			client.config.settings.python = client.config.settings.python or {}
			client.config.settings.python.pythonPath = python_path
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
				},
			},
		},
	},

	-- Rust
	rust_analyzer = {},

	-- SQL
	sqlls = {},

	-- LaTeX
	texlab = {},

	-- TypeScript
	ts_ls = {},

	-- Bash
	bashls = {},

	-- TOML
	taplo = {},

	-- PHP
	intelephense = {
		init_options = {
			licenceKey = vim.fn.expand("~/.intelephense/licence.txt"),
		},
	},

	-- XML
	lemminx = {},

	-- Docker
	docker_compose_language_service = {},
	dockerls = {},
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			-- Ensure all servers in our table plus jdtls are installed.
			ensure_installed = vim.list_extend(vim.tbl_keys(servers), { "jdtls" }),
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		keys = {
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
			{ "gr", vim.lsp.buf.references, desc = "Go to references" },
			{ "<space>ca", vim.lsp.buf.code_action, desc = "Code action", mode = { "n", "v" } },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for server, config in pairs(servers) do
				-- Skip jdtls here since it’s handled by nvim-jdtls.
				if server ~= "jdtls" then
					config = vim.tbl_deep_extend("force", { capabilities = capabilities }, config or {})
					lspconfig[server].setup(config)
				end
			end
		end,
	},
	{ "nvim-lua/lsp-status.nvim" },
	{ "onsails/lspkind.nvim" },
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		opts = function()
			return {
				cmd = { "jdtls" },
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
				settings = {
					java = {
						-- Configure additional Java settings here as needed.
					},
				},
			}
		end,
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					require("jdtls").start_or_attach(opts)
				end,
			})
		end,
	},
=======
    "ast_grep",                        -- Multi-language
    "clangd",                          -- C/C++
    "gopls",                           -- Go
    "html",                            -- HTML
    "lua_ls",                          -- Lua
    "marksman",                        -- Markdown
    "pyright",                         -- Python
    "rust_analyzer",                   -- Rust
    "sqlls",                           -- SQL
    "texlab",                          -- LaTeX
    "ts_ls",                           -- TypeScript
    "bashls",                          -- Bash
    "taplo",                           -- TOML
    "intelephense",                    -- PHP
    "lemminx",                         -- XML
    "docker_compose_language_service", -- Docker Compose
    "dockerls"                         -- Dockerfile
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
            { "K",         function() require("noice.lsp").hover() end, desc = "Definitions" },
            { "gd",        vim.lsp.buf.definitions,                     desc = "Go to definitions" },
            { "gr",        vim.lsp.buf.references,                      desc = "Go to reference" },
            { "<space>ca", vim.lsp.buf.code_action,                     desc = "Code action",         mode = { "n", "v" } },
            { "gi",        vim.lsp.buf.implementation,                  desc = "Go to implementation" },
        },
        config = function()
            require("java").setup()
            local lspconfig = require("lspconfig")
            lspconfig.jdtls.setup {}
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
    { 'nvim-java/nvim-java' }
    -- {
    --     "mfussenegger/nvim-jdtls",
    --     ft = "java",
    --     opts = function()
    --         return {
    --             cmd = { "jdtls" },
    --             root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
    --             settings = {
    --                 java = {
    --                     -- Configure Java settings here
    --                 },
    --             },
    --         }
    --     end,
    --     config = function(_, opts)
    --         vim.api.nvim_create_autocmd("FileType", {
    --             pattern = "java",
    --             callback = function()
    --                 require("jdtls").start_or_attach(opts)
    --             end,
    --         })
    --     end,
    -- },
>>>>>>> 3c9e1b5ca4e51b407696cca559f98f10d6f8b0db
}
