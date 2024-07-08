return {
	-- Git commands integrated into neovim
	{
		"tpope/vim-fugitive",
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
				["<leader>g"] = {
					name = "Git",
					["A"] = { mode = "n", "<cmd>Git add .<CR>", "Git [A]dd ." },
					["C"] = { mode = "n", "<cmd>Git commit<CR>", "Git [C]ommit" },
					["h"] = { mode = "n", "<cmd>Gitsigns preview_hunk<CR>", "[p]review hunk" },
					["r"] = { mode = "n", "<cmd>Gitsigns reset_hunk<CR>", "[r]eset hunk" },
					["D"] = { mode = "n", "<cmd>Gitsigns diffthis<CR>", "[D]iff this" },
					["d"] = { mode = "n", "<cmd>Gdiffsplit<CR>", "[d]iff split: working tree vs. staged " },
					["b"] = { mode = "n", "<cmd>Gitsigns toggle_current_line_blame<CR>", "[b]lame current line" },
				},

				["<leader>gv"] = {
					name = " Visualisation",
					["b"] = { mode = "n", "<cmd>Flog<CR>", " (b)ranches" },
					["s"] = { mode = "n", "<cmd>Flogsplit<CR>", " (s)plit" },
					["g"] = { mode = "n", "<cmd>Floggit<CR>", " (g)it" },
				},
			})
		end,
	},
	-- Git branches visualisation (:Flog)
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		--                                                           ▲
		--   TODO: config diffview                                   █
		--                                                           ▼
	},
}
