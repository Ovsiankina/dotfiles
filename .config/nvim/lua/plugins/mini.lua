return {
	{
		"echasnovski/mini.nvim",
	},

	-- Auto complete the missing pairs for e.g () {} []
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	-- Improve the textobject e.g inside content of () {} []
	{ "echasnovski/mini.ai", version = false },
}
