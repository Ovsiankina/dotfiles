local servers = {
	"ast_grep", -- AST Grep
	"clangd", -- C++
	"gopls", -- Go
	"html", -- HTML
	"jdtls", -- Java
	"lua_ls", -- Lua
	"marksman", -- Markdown
	"pyright", -- Python
	"rust_analyzer", -- Rust
	"sqlls", -- SQL
	"texlab", -- LaTeX
	"ts_ls", -- JavaScript
	"bashls", -- Bash
	"taplo", -- TOML
	"intelephense", -- PHP
	"lemminx", -- XML
	"docker_compose_language_service", -- Docker compose
	"dockerls", -- Dockerfile
	"csharp_ls", -- c#
}

return {
	-- LSP has three parts: Mason, Mason-lspconfig and nvim

	-- Mason
	-- Installs and manages the LSPs
	{
		"williamboman/mason.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-lspconfig
	-- Bridge the gap between neovim and Language servers and ensures languages
	-- are installed
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = servers,
			automatic_installation = true,
			-- java server
			servers = {
				jdtls = {},
			},
		},
	},

	-- nvim-lspconfig
	-- Allows neovim to communicate with language servers (I/O)
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- INTELEPHENSE

			lspconfig.intelephense.setup({
				init_options = {
					licenceKey = vim.fn.expand("~/.intelephense/licence.txt"),
				},
			})

			-- Function to get the virtual environment path dynamically
			local function get_python_path(workspace)
				-- Use the virtualenv in the workspace directory if available
				if workspace == nil then
					return vim.fn.exepath("python3") or vim.fn.exepath("python")
				end
				local venv_path = workspace .. "/.venv/bin/python" -- WARN: venv name can be something else than '/venv'
				local venv_exists = vim.fn.glob(venv_path)
				if venv_exists ~= "" then
					return venv_path
				end
				-- Fallback to system python if no virtualenv is found
				return vim.fn.exepath("python3") or vim.fn.exepath("python")
			end

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					on_init = server == "pyright" and function(client)
						local python_path = get_python_path(client.config.root_dir)
						client.config.settings.python.pythonPath = python_path
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end or nil,
				})
			end

			--          ╭─────────────────────────────────────────────────────────╮
			--          │                          Remap                          │
			--          ╰─────────────────────────────────────────────────────────╯

			local wk = require("which-key")
			wk.register({
				["K"] = { vim.lsp.buf.hover, "Definitions", mode = "n" },
				["gd"] = { vim.lsp.buf.definition, "Go to definitions", mode = "n" },
				["gr"] = { vim.lsp.buf.references, "Go to reference", mode = "n" },
				["<space>ca"] = { vim.lsp.buf.code_action, "Code action", mode = { "n", "v" } },
			})
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
