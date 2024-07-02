return {
	-- Git commands integrated into neovim
	{
		"tpope/vim-fugitive",
		config = function()
			----- Remap -----
			vim.keymap.set("n", "<space>gc", ":Git ", {})
		end,
	},
	-- Previews, blame, etc..
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			--          ╭─────────────────────────────────────────────────────────╮
			--          │                          Remap                          │
			--          ╰─────────────────────────────────────────────────────────╯

			local wk = require("which-key")
			wk.register({
				g = {
					mode = { "n" },
					name = " Git",
					c = { ":Git", "Short(c)ut for :Git in CMD" },
					p = { ":Gitsigns preview_hunk<CR>", "(P)review hunk" },
					b = {
						name = " Blame",
						l = { ":Gitsigns toggle_current_line_blame<CR>", "Blame current (L)ine" },
					},
					v = {
						name = " Visualisation",
						b = { ":Flog<CR>", " (B)ranches" },
						s = { ":Flogsplit<CR>", " (S)plit" },
						g = { ":Floggit<CR>", " (G)it" },
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
	-- Git branches visualisation (:Flog)
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
	},
}
