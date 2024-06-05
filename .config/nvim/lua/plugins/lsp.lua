return {
	-- LSP has three parts: Mason, Mason-lspconfig and nvim

	-- Mason
	-- Installs and manages the LSPs
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
		-- opts = function(_, opts)
		--   opts.ensure_installed = opts.ensure_installed or {}
		--   vim.list_extend(opts.ensure_installed, { "java-test", "java-debug-adapter" })
		-- end,
	},

	-- Mason-lspconfig
	-- Bridge the gap between neovim and Language servers and ensures languages
	-- are installed
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
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
			-- Function to get the virtual environment path dynamically
			local function get_python_path(workspace)
				-- Use the virtualenv in the workspace directory if available
				local venv_path = workspace .. "/venv/bin/python"
				local venv_exists = vim.fn.glob(venv_path)
				if venv_exists ~= "" then
					return venv_path
				end

				-- Fallback to system python if no virtualenv is found
				return vim.fn.exepath("python3") or vim.fn.exepath("python")
			end

			-- Setup pyright with dynamic Python path
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_init = function(client)
					local python_path = get_python_path(client.config.root_dir)
					client.config.settings.python.pythonPath = python_path
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end,
			}) -- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- JavaScript
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			-- SQL
			lspconfig.sqls.setup({
				capabilities = capabilities,
			})
			-- PHP
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			-- Java
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			-- HTML
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			-- cpp
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			-- md
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
		end,
	},
	{ "nvim-lua/lsp-status.nvim" },
}
