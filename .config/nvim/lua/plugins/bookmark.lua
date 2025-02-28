return {
	"zongben/navimark.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		keymap = {
			base = {
				mark_toggle = "<leader>mm",
				mark_add = "<leader>ma",
				mark_remove = "<leader>mr",
				goto_next_mark = "]m",
				goto_prev_mark = "[m",
				open_mark_picker = "<leader>fm",
			},
		},
		sign = {
			text = "",
			color = "#FF0000",
		},
		persist = true,
	},
	config = function()
		require("navimark").setup()
	end,
}
