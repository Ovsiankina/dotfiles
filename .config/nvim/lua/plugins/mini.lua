return {
	{
		"echasnovski/mini.nvim",
	},

	-- Auto complete the missing pairs for e.g () {} []
	{
		"echasnovski/mini.pairs",
		version = false,
		opts = {},
		config = function(_, opts)
			require("mini.pairs").setup(opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "gitcommit", "markdown" },
				callback = function(event)
					vim.keymap.set("i", "`", "`", { buffer = event.buf })
				end,
			})
		end,
	},
	-- Improve the textobject e.g inside content of () {} []
	{
		"echasnovski/mini.ai",
		version = false,
		opts = {},
	},
	{ "echasnovski/mini.nvim", version = false },
}
