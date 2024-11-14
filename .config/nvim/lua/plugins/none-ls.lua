local null_ls_sources = {
	"black", -- Python
	"stylua", -- Lua
	"latexindent", -- LaTeX
}

return {
	-- null-ls configuration
	{
		-- Allows formatters (from mason) to be used as LSPs
		-- Example: stylua replaces single quotes by double quotes
		"nvimtools/none-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			local sources = {}
			for _, source in ipairs(null_ls_sources) do
				table.insert(sources, require("null-ls").builtins.formatting[source])
			end
			null_ls.setup({
				sources = sources,
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
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			ensure_installed = null_ls_sources,
			automatic_installation = true,
		},
	},
}
